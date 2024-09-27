# DataStructure

## DatabaseOverview

[![](/dbml/emumet.dbml.svg)](https://dbdocs.io/shuttlepub965/emumet?view=relationships)

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
  - icon: `uuid`
  - banner: `uuid`
- profile_updated
  - display_name?: `text`
  - summary?: `text`
  - icon?: `uuid`
  - banner?: `uuid`
- profile_deleted

### Metadata

- metadata_created
  - account_id: `uuid`
  - label: `text`
  - content: `text`
- metadata_updated
  - label: `text`
  - content: `text`
- metadata_deleted

### StellarAccount

- stellar_account_created
  - host: `text`
  - client_id: `text`
  - access_token: `text`
  - refresh_token: `text`
- stellar_account_updated
  - access_token: `text`
  - refresh_token: `text`
- stellar_account_deleted

### Follow

- follow_requested
  - source:
    - type: `text`
    - id: `uuid`
  - destination:
    - type: `text`
    - id: `uuid`
- follow_approved
- follow_deleted

---
> Below events are not implemented yet.

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

### StellarAccountModeration

- stellar_account_moderation_created
  - target: `uuid`
  - moderated_by: `uuid`
  - type: `text`
  - comment: `text`
- stellar_account_moderation_updated
  - target?: `uuid`
  - moderated_by?: `uuid`
  - type?: `text`
  - comment?: `text`
- stellar_account_moderation_closed

### AccountModeration

- account_moderation_created
  - target: `uuid`
  - moderated_by: `uuid`
  - type: `text`
  - comment: `text`
- account_moderation_updated
  - target?: `uuid`
  - moderated_by?: `uuid`
  - type?: `text`
  - comment?: `text`
- account_moderation_closed

### AccountReport

- account_report_created
  - target: `uuid`
  - reported_by: `uuid`
  - type: `text`
  - comment: `text`
- account_report_updated
  - type?: `text`
  - comment?: `text`
- account_report_closed
  - close_reason: `text`