# DataStructure

```mermaid
classDiagram
	class Account {
		id: long
		account_name: String
		is_bot: bool
		confidential: Confidential
		profile: Profile
		follow: Vec[Follow]
	}
	class Profile {
		display_name: String
		summary: String
		icon: String
		banner: String
		meta_data: Vec[MetaData]
	}
	class Follow {
		id: ULID
		target: [AccountId[long] | String]
	}
	class MetaData {
		index: long
		label: String
		content: String
	}
	class Confidential {
		mail: String
		password: String
	}
	Account --|> Confidential
	Account --|> Profile
	Account --|> Follow
	Profile --|> MetaData
```
