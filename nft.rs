// Define the struct for an NFT ticket
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct Ticket {
  id: TicketId,
  owner: AccountId,
  event: String,
}

// Implement the Smart Contract trait
impl Contract for Ticket {
  // Define the dispatchable functions
  fn transfer(&mut self, to: AccountId) {
    self.owner = to;
  }
  
  fn burn(&mut self) {
    // Remove the ticket from storage
  }
}

// Define the module's configuration trait
pub trait Config: System {
  type Event: From<Event<Self>> + Into<<Self as System>::Event>;
}

// Implement the module
decl_module! {
  pub struct Module<T: Config> for enum Call where origin: T::Origin {
    fn transfer_ticket(origin, ticket_id: TicketId, to: T::AccountId) -> DispatchResult {
      let sender = ensure_signed(origin)?;
      let ticket = Self::ticket(ticket_id);
      <Ticket<T> as Contract>::transfer(ticket, to);
      Ok(())
    }
    
    fn burn_ticket(origin, ticket_id: TicketId) -> DispatchResult {
      let sender = ensure_signed(origin)?;
      let ticket = Self::ticket(ticket_id);
      <Ticket<T> as Contract>::burn(ticket);
      Ok(())
    }
  }
}
