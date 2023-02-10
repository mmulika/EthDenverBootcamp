// import necessary modules
use frame_support::{decl_module, dispatch::DispatchResult};
use frame_system::{self as system, ensure_signed};
use pallet_timestamp::Call as TimestampCall;

// Define the crowdfunding smart contract
pub trait Trait: system::Trait + TimestampCall { }

// Define the storage items for the smart contract
decl_module! {
    pub struct Module<T: Trait> for enum Call where origin: T::Origin {
        // Define the function to contribute to the crowdfunding
        #[weight = 0]
        pub fn contribute(origin, amount: T::Balance) -> DispatchResult {
            // Ensure that the contribution is made by a signed user
            let sender = ensure_signed(origin)?;

            // Add the contribution to the total contributions
            TotalContributions::mutate(|total| *total += amount);

            // Add the contribution to the sender's contribution
            Contributions::insert(&sender, amount);

            // Return a successful dispatch result
            Ok(())
        }
    }
}

// Define the storage items for the smart contract
decl_storage! {
    trait Store for Module<T: Trait> as Crowdfunding {
        // Total contributions
        TotalContributions get(fn total_contributions) : T::Balance;

        // Contributions of each user
        Contributions get(fn contributions) : map hasher(blake2_128_concat) T::AccountId => T::Balance;
    }
}
