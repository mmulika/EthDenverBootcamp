// Define the struct for a carbon credit
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct CarbonCredit {
  owner: AccountId,
  credits: u64,
}

// Implement the Smart Contract trait
impl Contract for CarbonCredit {
  // Define the dispatchable functions
  fn deposit(&mut self, deposit: u64) {
    self.credits += deposit;
  }
  
  fn transfer(&mut self, to: AccountId, credits: u64) -> DispatchResult {
    if self.credits < credits {
      return Err(Error::<T>::InsufficientBalance.into());
    }
    self.credits -= credits;
    let new_balance = Balances::get(&to);
    Balances::set(&to, new_balance + credits);
    Ok(())
  }
}

// Define the module's configuration trait
pub trait Config: System {
  type Event: From<Event<Self>> + Into<<Self as System>::Event>;
}

// Implement the module
decl_module! {
  pub struct Module<T: Config> for enum Call where origin: T::Origin {
    fn deposit_carbon_credits(origin, credits: u64) -> DispatchResult {
      let sender = ensure_signed(origin)?;
      let carbon_credit = Self::carbon_credit_of(&sender);
      <CarbonCredit<T> as Contract>::deposit(carbon_credit, credits);
      Ok(())
    }
    
    fn transfer_carbon_credits(origin, to: T::AccountId, credits: u64) -> DispatchResult {
      let sender = ensure_signed(origin)?;
      let carbon_credit = Self::carbon_credit_of(&sender);
      <CarbonCredit<T> as Contract>::transfer(carbon_credit, to, credits)?;
      Ok(())
    }
  }
}
