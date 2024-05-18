# DataStructure

## DatabaseOverview

```mermaid
erDiagram
    accounts {
        uuid id "PK,FK"
        text name
        text private_key
        text public_key
        boolean is_bot
        timestamp created_at
        boolean is_deleted
    }
    account_events {
        bigint version "PK"
        uuid account_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    profiles {
        uuid account_id "PK,FK"
        text display_name "NULL"
        text summary "NULL"
        text icon_id "NULL,FK(image_id)"
        text banner_id "NULL,FK(image_id)"
    }
    profile_events {
        bigint version "PK"
        uuid account_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    metadatas {
        uuid id "PK,FK"
        uuid account_id "FK"
        text label
        text content
    }
    metadata_events {
        bigint version "PK"
        uuid metadata_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    stellar_hosts {
        uuid id "PK"
        text host "UNIQUE"
    }
    stellar_accounts {
        uuid id "PK,FK"
        uuid host "PK,FK(stellar_host)"
        text clinet_id "PK"
        text access_token
        text refresh_token
    }
    stellar_account_events {
        bigint version "PK"
        uuid stellar_account_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    stellar_emumet_accounts {
        uuid stellar_id "PK,FK"
        uuid emumet_id "PK,FK"
    }
    follows {
        uuid id "PK,FK"
        uuid source_local "NULL,FK(account_id"
        uuid source_remote "NULL,FK(remote_account_id)"
        uuid destination_local "NULL,FK(account_id"
        uuid destination_remote "NULL,FK(remote_account_id)"
        timetamp approved_at "NULL"
    }
    follow_events {
        bigint version "PK"
        uuid follow_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    remote_accounts {
        uuid id "PK"
        text acct "UNIQUE"
        text url "UNIQUE"
        text icon_id "FK(image_id)"
    }
    images {
        uuid id "PK"
        text url "UNIQUE"
        text hash
        text blurhash
    }
    moderator_roles {
        uuid id "PK"
        text role_name
    }
    moderators {
        uuid stellar_id "PK,FK(stellar_account)"
        uuid role_id "PK,FK(moderator_role)"
    }
    moderator_events {
        bigint version "PK"
        uuid stellar_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    host_moderation {
        uuid id "PK"
        uuid target "FK(stellar_host)"
        uuid moderated_by "FK(stellar_id)"
        text type
        text comment
        timestamp created_at
        timestamp closed_at "NULL"
    }
    host_moderation_events {
        bigint version "PK"
        uuid moderation_id "PK"
        text event_name
        json data
        timestamp created_at
    }
    user_moderation {
        uuid id "PK"
        uuid target "FK(account_id)"
        uuid moderated_by "FK(stellar_id)"
        text type
        text comment
        timestamp created_at
        timestamp closed_at "NULL"
    }
    user_moderation_events {
        bigint version "PK"
        uuid moderation_id "PK"
        text event_name
        json data
        timestamp created_at
    }

    accounts ||--|{ account_events: "account history"
    accounts ||--|| profiles: "profile"
    stellar_hosts ||--|{ stellar_accounts: "accounts"
    stellar_accounts ||--|{ stellar_emumet_accounts: "linked accounts"
    stellar_accounts ||--o{ stellar_account_events: "account history"
    moderators ||--|{ moderator_events: "moderator history"
    moderators ||--o| stellar_accounts: "moderators"
    accounts ||--|{ stellar_emumet_accounts: "linked accounts"
    metadatas }|--|{ metadata_events: "metadata history"
    profiles ||--o{ metadatas: "social links"
    profiles ||--o{ profile_events: "profile history"
    accounts ||--o{ follows: "followings"
    follows }o--|| remote_accounts: "foreign followers"
    follows ||--|{ follow_events: "follow history"
    profiles ||--o{ images: "icon&banner"
    remote_accounts ||--|| images: "icon"
    stellar_hosts ||--o| host_moderation: "moderation"
    host_moderation ||--|{ host_moderation_events: "moderation history"
    accounts ||--o| user_moderation: "moderation"
    stellar_accounts ||--o| user_moderation: "moderation"
    user_moderation ||--|{ user_moderation_events: "moderation history"
```

## Events

### Account

- account_created
  - name: `text`
  - private_key: `text`
  - public_key: `text`
  - is_bot: `boolean`
- account_updated
  - is_bot: `boolean`
- account_deleted

### Profile

- profile_created
  - display_name: `text`
  - summary: `text`
  - icon_id: `text`
  - banner_id: `text`
- profile_updated
  - display_name?: `text`
  - summary?: `text`
  - icon_id?: `text`
  - banner_id?: `text`
- profile_deleted

### Metadata

- metadata_created
  - label: `text`
  - content: `text`
- metadata_updated
  - label?: `text`
  - content?: `text`
- metadata_deleted

### StellarAccount

- stellar_account_created
  - host: `text`
  - client_id: `text`
  - access_token: `text`
  - refresh_token: `text`
- stellar_account_updated
  - host?: `text`
  - client_id?: `text`
  - access_token?: `text`
  - refresh_token?: `text`
- stellar_account_deleted

### Follow

- follow_requested
  - source_local?: `uuid`
  - source_remote?: `uuid`
  - destination_local?: `uuid`
  - destination_remote?: `uuid`
- follow_accepted
  - source_local?: `uuid`
  - source_remote?: `uuid`
  - destination_local?: `uuid`
  - destination_remote?: `uuid`
- follow_rejected
  - source_local?: `uuid`
  - source_remote?: `uuid`
  - destination_local?: `uuid`
  - destination_remote?: `uuid`

### Moderator

- role_created
  - role_name: `text`
- role_updated
  - role_name: `text`
  - role_deleted
- moderator_assigned
  - role_name: `text`
  - account_id: `uuid`
- moderator_unassigned
  - role_name: `text`
  - account_id: `uuid`

### HostModeration

- hostModeration_created
  - target: `uuid`
  - moderated_by: `uuid`
  - type: `text`
  - comment: `text`
- host_moderation_updated
  - target?: `uuid`
  - moderated_by?: `uuid`
  - type?: `text`
  - comment?: `text`
- host_moderation_closed

### UserModeration

- user_moderation_created
  - target: `uuid`
  - moderated_by: `uuid`
  - type: `text`
  - comment: `text`
- user_moderation_updated
  - target?: `uuid`
  - moderated_by?: `uuid`
  - type?: `text`
  - comment?: `text`
- user_moderation_closed