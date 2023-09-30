# DataStructure

## Account

```mermaid
erDiagram
accounts {
	bigserial id "PK"
	text domain "PK"
	uuid stellar_id "PK,FK"
	varchar(50) name
	boolean is_bot
	timestamp created_at
}
profiles {
	bigserial account_id "FK"
	varchar(64) display_name "nullable"
	text summary "nullable"
 	varchar(256) icon "nullable"
	varchar(256) banner "nullable"
}
metadatas {
	bigserial id "PK"
	bigserial account_id "FK"
	varchar(16) label
	varchar(16) content
}
stellar_accounts {
	uuid id "PK"
	varchar(512) host "PK"
	varchar(512) access_token
	varchar(512) refresh_token
}
follows {
	uuid id "PK"
	bigsrial source_local "FK(account_id),nullable"
	bigserial source_remote "FK(remote_account_id),nullable"
	
	bigserial destination_local "FK(account_id),nullable"
	bigserial destination_remote "FK(remote_account_id)nullable"
}

remote_accounts {
	bigserial id "PK"
	varchar(512) url "UNIQUE"
}

accounts ||--|| profiles : "equals"
stellar_accounts ||--o{ accounts : "created accounts"
profiles ||--o{ metadatas : "social links"
accounts ||--o{ follows : "followings"
follows }o--|| remote_accounts : "foreign followers"
```
