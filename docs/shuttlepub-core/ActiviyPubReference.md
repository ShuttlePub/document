# ActivityPubReference

正直w3cとかのリファレンス見ててもなんか違ったり説明がないような動作が実際に動いてる通信にはあるので、存在してるものから実装を読み解いてここに置いておく

ここで受け取る形式は全て[JSON-LD](https://www.w3.org/TR/json-ld/) 基本的にはHeaderに`Accept: application/activity+json`を付けるとこれが貰える

## ユーザー(Person)

**social.vivaldi.net**
`https://social.vivaldi.net/@watagame`

```json
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    "https://w3id.org/security/v1",
    {
      "manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
      "toot": "http://joinmastodon.org/ns#",
      "featured": {
        "@id": "toot:featured",
        "@type": "@id"
      },
      "featuredTags": {
        "@id": "toot:featuredTags",
        "@type": "@id"
      },
      "alsoKnownAs": {
        "@id": "as:alsoKnownAs",
        "@type": "@id"
      },
      "movedTo": {
        "@id": "as:movedTo",
        "@type": "@id"
      },
      "schema": "http://schema.org#",
      "PropertyValue": "schema:PropertyValue",
      "value": "schema:value",
      "discoverable": "toot:discoverable",
      "Device": "toot:Device",
      "Ed25519Signature": "toot:Ed25519Signature",
      "Ed25519Key": "toot:Ed25519Key",
      "Curve25519Key": "toot:Curve25519Key",
      "EncryptedMessage": "toot:EncryptedMessage",
      "publicKeyBase64": "toot:publicKeyBase64",
      "deviceId": "toot:deviceId",
      "claim": {
        "@type": "@id",
        "@id": "toot:claim"
      },
      "fingerprintKey": {
        "@type": "@id",
        "@id": "toot:fingerprintKey"
      },
      "identityKey": {
        "@type": "@id",
        "@id": "toot:identityKey"
      },
      "devices": {
        "@type": "@id",
        "@id": "toot:devices"
      },
      "messageFranking": "toot:messageFranking",
      "messageType": "toot:messageType",
      "cipherText": "toot:cipherText",
      "suspended": "toot:suspended",
      "Emoji": "toot:Emoji",
      "focalPoint": {
        "@container": "@list",
        "@id": "toot:focalPoint"
      }
    }
  ],
  "id": "https://social.vivaldi.net/users/watagame",
  "type": "Person",
  "following": "https://social.vivaldi.net/users/watagame/following",
  "followers": "https://social.vivaldi.net/users/watagame/followers",
  "inbox": "https://social.vivaldi.net/users/watagame/inbox",
  "outbox": "https://social.vivaldi.net/users/watagame/outbox",
  "featured": "https://social.vivaldi.net/users/watagame/collections/featured",
  "featuredTags": "https://social.vivaldi.net/users/watagame/collections/tags",
  "preferredUsername": "watagame",
  "name": "わたがめ",
  "summary": "<p>Mastodonなんもわからん<br />:vivaldi_red: on ArchLinux<br />watagame != わたげーむ<br />今はまだサブ的な</p>",
  "url": "https://social.vivaldi.net/@watagame",
  "manuallyApprovesFollowers": false,
  "discoverable": false,
  "published": "2022-11-15T00:00:00Z",
  "devices": "https://social.vivaldi.net/users/watagame/collections/devices",
  "publicKey": {
    "id": "https://social.vivaldi.net/users/watagame#main-key",
    "owner": "https://social.vivaldi.net/users/watagame",
    "publicKeyPem": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAud4fDEnVC3br/rhJGCt7\nHzei4Mn6edpfpz1Fcd3nLC6/Pb1d/LsCk9HxAT7uqui8ibxMBGfU/PKDC1BPW7RM\nIUQ4l62hxsxWdy7TCEfBFCONCeDVC8hhSpyzkmCXMQWcwYsSYZMq6QfV/Xetkoce\nOPS6eNvApLmk/yOikcolzyp5S7ieoO8DIo21e8mXVX1rm6pzf2JPGd+auzXOtl9I\ng2d0vRlvSz6tML6aBONuz8r65FfBbo8cn8dqFMUps/wlRwabCd21NykAM8kI7o4z\nEpDp3x148Dh8g+h5bs3UJxy4BQ6yICwrSZ6uoWdEJhF9Ezhsad+7WY+DoDaqc+we\nSQIDAQAB\n-----END PUBLIC KEY-----\n"
  },
  "tag": [
    {
      "id": "https://social.vivaldi.net/emojis/13",
      "type": "Emoji",
      "name": ":vivaldi_red:",
      "updated": "2022-11-11T12:00:07Z",
      "icon": {
        "type": "Image",
        "mediaType": "image/png",
        "url": "https://social-cdn.vivaldi.net/system/custom_emojis/images/000/000/013/original/8e8b84474ea67899.png"
      }
    }
  ],
  "attachment": [
    {
      "type": "PropertyValue",
      "name": "GitHub",
      "value": "<a href=\"https://github.com/turtton\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://</span><span class=\"\">github.com/turtton</span><span class=\"invisible\"></span></a>"
    },
    {
      "type": "PropertyValue",
      "name": "Twitter",
      "value": "<a href=\"https://twitter.com/turtton\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://</span><span class=\"\">twitter.com/turtton</span><span class=\"invisible\"></span></a>"
    }
  ],
  "endpoints": {
    "sharedInbox": "https://social.vivaldi.net/inbox"
  },
  "icon": {
    "type": "Image",
    "mediaType": "image/png",
    "url": "https://social-cdn.vivaldi.net/system/accounts/avatars/109/346/896/912/509/247/original/ed8be898e15f1299.png"
  },
  "image": {
    "type": "Image",
    "mediaType": "image/png",
    "url": "https://social-cdn.vivaldi.net/system/accounts/headers/109/346/896/912/509/247/original/ef2e593f177a0670.png"
  }
}
```

一般的なmastodonのユーザー情報。typeがPersonになってる

**sportsbots.xyz**
`https://sportsbots.xyz/users/EvanRobertsWFAN`

```json
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    "https://w3id.org/security/v1",
    {
      "manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
      "toot": "http://joinmastodon.org/ns#",
      "alsoKnownAs": {
        "@id": "as:alsoKnownAs",
        "@type": "@id"
      },
      "movedTo": {
        "@id": "as:movedTo",
        "@type": "@id"
      },
      "schema": "http://schema.org#",
      "PropertyValue": "schema:PropertyValue",
      "value": "schema:value",
      "discoverable": "toot:discoverable",
      "Emoji": "toot:Emoji"
    }
  ],
  "id": "https://sportsbots.xyz/users/EvanRobertsWFAN",
  "type": "Service",
  "following": "https://sportsbots.xyz/users/42680955/following",
  "followers": "https://sportsbots.xyz/users/42680955/followers",
  "inbox": "https://sportsbots.xyz/inboxes/EvanRobertsWFAN",
  "outbox": "https://sportsbots.xyz/users/42680955/outbox",
  "preferredUsername": "EvanRobertsWFAN",
  "name": "Evan Roberts :verified_legacy: 🤖",
  "summary": "<p>Unofficial bot that mirrors Evan Roberts’s Twitter feed.</p><p>Afternoon host on WFAN with Craig Carton. Host of Rico Brogna.  Email the pod at TheRicoB@Gmail.com <a href=\"http://podcasts.apple.com/us/podcast/ric\" target=\"_blank\" rel=\"nofollow noopener noreferrer\"><span class=\"invisible\">http://</span><span class=\"\">podcasts.apple.com/us/podcast/ric</span><span class=\"invisible\"></span></a>…</p>",
  "url": "https://twitter.com/EvanRobertsWFAN",
  "manuallyApprovesFollowers": false,
  "discoverable": true,
  "published": "2009-05-26T18:10:38.000Z",
  "publicKey": {
    "id": "https://sportsbots.xyz/users/EvanRobertsWFAN#main-key",
    "owner": "https://sportsbots.xyz/users/EvanRobertsWFAN",
    "publicKeyPem": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0DymFUJxKamHzuP6bNnH\nq6PxYcz4d5IOYy+QDaKp7Dl0F7dyoM95dQlioHgahcqoZmTTTflP9nTvkpFvJP/6\nbAN1W1llRkmiawOBttmY1+MZr+vV4DdLHvzq9Vvmg4gnmkL44YjFtqV4lDhim4g0\npb96dtUQg3gdJ2JMUqe2nWGfAixLiOOmE+1YtmxUJrZGOGumUxRCvfc8y02vcmW0\n166PEBeg1AB/OHPp/VMhvCPQiuf0ROxglh8qAcOw6Xgp0BOOGSnGHkUN9J0Rm00F\nizBTLN5SwAVyR1y3xdobY7lZfTDyCa64oWqQSYbq+Qwu7YfLHGxj3htxMtt9jse8\ns5QiFHpgrpg6Jh6QI7szrwwEVWVADpzGR91vjd73u40m/rNpgIVQ1k6QzziT+w2G\npNoLCBiS04Csk80aeThYjS2ZE8P1O56PW6d9XiWxx0cErgGaEk9nHlQTTw/+IhLx\nQt5owk+rS0gDCttff2vLg8YFZMdXLuY7DZRvZLpTPLuKJtUj3w/vmMDhXHhU4kA/\nkwZMg6k3XV4voaUcyTC+wzI02ZdtXD6AvmCp1LM2KvRTkPEfQrzMcobWbNB/NCcZ\noyutY2/UZL/7AOITAWpXJ8fqreh9CeCCMhQ24IwMq/dxVYCcR0PVJDJOdXCQo24Q\nOCWw39BTfrMQbzj7TovGrXcCAwEAAQ==\n-----END PUBLIC KEY-----\n"
  },
  "tag": [
    {
      "id": "https://sportsbots.xyz/emojis/verified_legacy",
      "type": "Emoji",
      "name": ":verified_legacy:",
      "updated": "2022-01-07T01:00:00.000Z",
      "icon": {
        "type": "Image",
        "mediaType": "image/png",
        "url": "https://sportsbots.xyz/emojis/verified_legacy.png"
      }
    }
  ],
  "attachment": [
    {
      "type": "PropertyValue",
      "name": "Twitter",
      "value": "<a href=\"https://twitter.com/EvanRobertsWFAN\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://</span><span class=\"\">twitter.com/EvanRobertsWFAN</span><span class=\"invisible\"></span></a>"
    },
    {
      "type": "PropertyValue",
      "name": "Twitter Verified",
      "value": "Notable"
    },
    {
      "type": "PropertyValue",
      "name": "Website",
      "value": "<a href=\"https://podcasts.apple.com/us/podcast/the-evan-roberts-podcast/id1366368572\" target=\"_blank\" rel=\"nofollow noopener noreferrer me\"><span class=\"invisible\">https://</span><span class=\"\">podcasts.apple.com/us/podcast/the-evan-roberts-podcast/id1366368572</span><span class=\"invisible\"></span></a>"
    },
    {
      "type": "PropertyValue",
      "name": "Managed by",
      "value": "<span class=\"h-card\"><a href=\"https://mastodon.social/@sportsbots\" class=\"u-url mention\">@<span>sportsbots</span></a></span>"
    },
    {
      "type": "PropertyValue",
      "name": "Retention",
      "value": "<span class=\"h-card\">90 days</span>"
    }
  ],
  "icon": {
    "type": "Image",
    "mediaType": "image/png",
    "url": "https://pbs.twimg.com/profile_images/1490500111117524993/LFXBCpOW_400x400.jpg"
  }
}
```

こちらも一般的なユーザー情報かと思いきやtypeがServiceになってる大変お行儀の悪い(ように見える)json。  
なんでこれでみんな認識できてるんですか？

## 投稿記事

**social.vivaildi.net**

`https://social.vivaldi.net/@watagame/109381640182654633`

```json
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    {
      "ostatus": "http://ostatus.org#",
      "atomUri": "ostatus:atomUri",
      "inReplyToAtomUri": "ostatus:inReplyToAtomUri",
      "conversation": "ostatus:conversation",
      "sensitive": "as:sensitive",
      "toot": "http://joinmastodon.org/ns#",
      "votersCount": "toot:votersCount"
    }
  ],
  "id": "https://social.vivaldi.net/users/watagame/statuses/109381640182654633",
  "type": "Note",
  "summary": null,
  "inReplyTo": null,
  "published": "2022-11-21T11:49:34Z",
  "url": "https://social.vivaldi.net/@watagame/109381640182654633",
  "attributedTo": "https://social.vivaldi.net/users/watagame",
  "to": [
    "https://www.w3.org/ns/activitystreams#Public"
  ],
  "cc": [
    "https://social.vivaldi.net/users/watagame/followers"
  ],
  "sensitive": false,
  "atomUri": "https://social.vivaldi.net/users/watagame/statuses/109381640182654633",
  "inReplyToAtomUri": null,
  "conversation": "tag:vivaldi.net,2022-11-21:objectId=576002:objectType=Conversation",
  "content": "<p>オレオレインスタンスの設立、ドメインもあるし踏み台用のクラウドもあるけど、運用より開発のほうが興味あるし、そもそもこれをそこまでヘビーに使える自身がないよね</p>",
  "contentMap": {
    "en": "<p>オレオレインスタンスの設立、ドメインもあるし踏み台用のクラウドもあるけど、運用より開発のほうが興味あるし、そもそもこれをそこまでヘビーに使える自身がないよね</p>"
  },
  "attachment": [],
  "tag": [],
  "replies": {
    "id": "https://social.vivaldi.net/users/watagame/statuses/109381640182654633/replies",
    "type": "Collection",
    "first": {
      "type": "CollectionPage",
      "next": "https://social.vivaldi.net/users/watagame/statuses/109381640182654633/replies?only_other_accounts=true&page=true",
      "partOf": "https://social.vivaldi.net/users/watagame/statuses/109381640182654633/replies",
      "items": []
    }
  }
}
```

**misskey.dev**

`https://misskey.dev/notes/9awjwlljni`

```json
{
    "@context": [
        "https://www.w3.org/ns/activitystreams",
        "https://w3id.org/security/v1",
        {
            "manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
            "sensitive": "as:sensitive",
            "Hashtag": "as:Hashtag",
            "quoteUrl": "as:quoteUrl",
            "toot": "http://joinmastodon.org/ns#",
            "Emoji": "toot:Emoji",
            "featured": "toot:featured",
            "discoverable": "toot:discoverable",
            "schema": "http://schema.org#",
            "PropertyValue": "schema:PropertyValue",
            "value": "schema:value",
            "misskey": "https://misskey.dev/ns#",
            "_misskey_content": "misskey:_misskey_content",
            "_misskey_quote": "misskey:_misskey_quote",
            "_misskey_reaction": "misskey:_misskey_reaction",
            "_misskey_votes": "misskey:_misskey_votes",
            "_misskey_talk": "misskey:_misskey_talk",
            "isCat": "misskey:isCat",
            "vcard": "http://www.w3.org/2006/vcard/ns#"
        }
    ],
    "id": "https://misskey.dev/notes/9awjwlljni",
    "type": "Note",
    "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
    "summary": null,
    "content": "<p><span>「mapの中にmapは危険」というレビューコメントを発見した</span>🤔<span><br>「複雑な処理となるので、注意して実装しましょう」という意味でなら理解できるが…。</span></p>",
    "_misskey_content": "「mapの中にmapは危険」というレビューコメントを発見した🤔\n「複雑な処理となるので、注意して実装しましょう」という意味でなら理解できるが…。",
    "published": "2023-02-06T15:47:31.543Z",
    "to": [
        "https://www.w3.org/ns/activitystreams#Public"
    ],
    "cc": [
        "https://misskey.dev/users/8w72bqn1gt/followers"
    ],
    "attachment": [],
    "sensitive": false,
    "tag": []
}
```

URLが`@user/id` になってない部分とかがmastodonとは違うことがよくわかる。ちなみにmastodonから見たときは`https://social.vivaldi.net/@momosetkn@misskey.dev/109818573742231014`みたく数字idになる。[これどっから来たの....](reference.md#記事URL)

## outbox

Personの中にあるやつ

**misskey.dev**

`https://misskey.dev/users/8w72bqn1gt/outbox`

```json
{
    "@context": [
        "https://www.w3.org/ns/activitystreams",
        "https://w3id.org/security/v1",
        {
            "manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
            "sensitive": "as:sensitive",
            "Hashtag": "as:Hashtag",
            "quoteUrl": "as:quoteUrl",
            "toot": "http://joinmastodon.org/ns#",
            "Emoji": "toot:Emoji",
            "featured": "toot:featured",
            "discoverable": "toot:discoverable",
            "schema": "http://schema.org#",
            "PropertyValue": "schema:PropertyValue",
            "value": "schema:value",
            "misskey": "https://misskey.dev/ns#",
            "_misskey_content": "misskey:_misskey_content",
            "_misskey_quote": "misskey:_misskey_quote",
            "_misskey_reaction": "misskey:_misskey_reaction",
            "_misskey_votes": "misskey:_misskey_votes",
            "_misskey_talk": "misskey:_misskey_talk",
            "isCat": "misskey:isCat",
            "vcard": "http://www.w3.org/2006/vcard/ns#"
        }
    ],
    "id": "https://misskey.dev/users/8w72bqn1gt/outbox",
    "type": "OrderedCollection",
    "totalItems": 774,
    "first": "https://misskey.dev/users/8w72bqn1gt/outbox?page=true",
    "last": "https://misskey.dev/users/8w72bqn1gt/outbox?page=true&since_id=000000000000000000000000"
}
```

投稿記事に関する情報。`first`にあるURLを叩くと何件か記事が取得できる

### outbox(first)

`ttps://misskey.dev/users/8w72bqn1gt/outbox?page=true`

```json
{
    "@context": [
        "https://www.w3.org/ns/activitystreams",
        "https://w3id.org/security/v1",
        {
            "manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
            "sensitive": "as:sensitive",
            "Hashtag": "as:Hashtag",
            "quoteUrl": "as:quoteUrl",
            "toot": "http://joinmastodon.org/ns#",
            "Emoji": "toot:Emoji",
            "featured": "toot:featured",
            "discoverable": "toot:discoverable",
            "schema": "http://schema.org#",
            "PropertyValue": "schema:PropertyValue",
            "value": "schema:value",
            "misskey": "https://misskey.dev/ns#",
            "_misskey_content": "misskey:_misskey_content",
            "_misskey_quote": "misskey:_misskey_quote",
            "_misskey_reaction": "misskey:_misskey_reaction",
            "_misskey_votes": "misskey:_misskey_votes",
            "_misskey_talk": "misskey:_misskey_talk",
            "isCat": "misskey:isCat",
            "vcard": "http://www.w3.org/2006/vcard/ns#"
        }
    ],
    "id": "https://misskey.dev/users/8w72bqn1gt/outbox?page=true",
    "partOf": "https://misskey.dev/users/8w72bqn1gt/outbox",
    "type": "OrderedCollectionPage",
    "totalItems": 774,
    "orderedItems": [
        {
            "id": "https://misskey.dev/notes/9awkfs8xv3/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T16:02:26.625Z",
            "object": {
                "id": "https://misskey.dev/notes/9awkfs8xv3",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>MySQLのNested loop joinもmapの中にmapが入っているのと似たようなもんだけど</span></p>",
                "_misskey_content": "MySQLのNested loop joinもmapの中にmapが入っているのと似たようなもんだけど",
                "published": "2023-02-06T16:02:26.625Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awjwlljni/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T15:47:31.543Z",
            "object": {
                "id": "https://misskey.dev/notes/9awjwlljni",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>「mapの中にmapは危険」というレビューコメントを発見した</span>🤔<span><br>「複雑な処理となるので、注意して実装しましょう」という意味でなら理解できるが…。</span></p>",
                "_misskey_content": "「mapの中にmapは危険」というレビューコメントを発見した🤔\n「複雑な処理となるので、注意して実装しましょう」という意味でなら理解できるが…。",
                "published": "2023-02-06T15:47:31.543Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awdygkbv3/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T13:01:00.635Z",
            "object": {
                "id": "https://misskey.dev/notes/9awdygkbv3",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>今どきのJava開発案件では、Optional型って積極的に使われてるんだろうか。</span></p>",
                "_misskey_content": "今どきのJava開発案件では、Optional型って積極的に使われてるんだろうか。",
                "published": "2023-02-06T13:01:00.635Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awdrcrug6/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Announce",
            "published": "2023-02-06T12:55:29.130Z",
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ],
            "object": "https://misskey.dev/notes/9awdlo1wff"
        },
        {
            "id": "https://misskey.dev/notes/9awdg06crp/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T12:46:39.588Z",
            "object": {
                "id": "https://misskey.dev/notes/9awdg06crp",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>あまりにひどいJavaのバッチを100倍ぐらい高速化したことあります。メモリ使用量もたぶん半分以下ぐらいには減らしたかな？</span></p>",
                "_misskey_content": "あまりにひどいJavaのバッチを100倍ぐらい高速化したことあります。メモリ使用量もたぶん半分以下ぐらいには減らしたかな？",
                "published": "2023-02-06T12:46:39.588Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awd4uwh18/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T12:37:59.537Z",
            "object": {
                "id": "https://misskey.dev/notes/9awd4uwh18",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>はい。要は慣れですね。<br>アプレットは今の時代、触ること無いんじゃないかな。サーブレットは、フレームワークを使ってれば、直接触ることはなさそうな…。<br>Javaなら、だいたいなんでも揃う。後方互換性があるので、古いJavaのライブラリも使えるのが利点ではありますね。<br>mavenも最近は触らなくなって、Scalaで遊ぶんで、sbt使ってますね。</span></p>",
                "_misskey_content": "はい。要は慣れですね。\nアプレットは今の時代、触ること無いんじゃないかな。サーブレットは、フレームワークを使ってれば、直接触ることはなさそうな…。\nJavaなら、だいたいなんでも揃う。後方互換性があるので、古いJavaのライブラリも使えるのが利点ではありますね。\nmavenも最近は触らなくなって、Scalaで遊ぶんで、sbt使ってますね。",
                "published": "2023-02-06T12:37:59.537Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "inReplyTo": "https://misskey.dev/notes/9awcxdf022",
                "attachment": [],
                "sensitive": false,
                "tag": [
                    {
                        "type": "Mention",
                        "href": "https://misskey.dev/users/97sxzn0cy7",
                        "name": "@sanao"
                    }
                ]
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awclp6ffq/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T12:23:05.655Z",
            "object": {
                "id": "https://misskey.dev/notes/9awclp6ffq",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": "七瀬といったら？",
                "content": "<p><span>相川七瀬</span></p>",
                "_misskey_content": "相川七瀬",
                "published": "2023-02-06T12:23:05.655Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": true,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9awce7e3oz/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T12:17:16.011Z",
            "object": {
                "id": "https://misskey.dev/notes/9awce7e3oz",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>毎日、コードジャンプでJava標準クラスの中を覗いたり、Javadocを読んだりしてれば慣れますよ。膨大そうに見えて、継承先・継承元とかで分類してると関係性とかが見えてきます。<br>毎日、魚図鑑を読んでると、類似した魚や大まかな分類とかが見えます。</span></p>",
                "_misskey_content": "毎日、コードジャンプでJava標準クラスの中を覗いたり、Javadocを読んだりしてれば慣れますよ。膨大そうに見えて、継承先・継承元とかで分類してると関係性とかが見えてきます。\n毎日、魚図鑑を読んでると、類似した魚や大まかな分類とかが見えます。",
                "published": "2023-02-06T12:17:16.011Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "inReplyTo": "https://misskey.dev/notes/9awc1y84ju",
                "attachment": [],
                "sensitive": false,
                "tag": [
                    {
                        "type": "Mention",
                        "href": "https://misskey.dev/users/97sxzn0cy7",
                        "name": "@sanao"
                    }
                ]
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw5xmyt4s/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T09:16:25.349Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw5xmyt4s",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>しかも、C言語に寄ってしまっていて、今の人のほとんどの人には合わないかも。</span></p>",
                "_misskey_content": "しかも、C言語に寄ってしまっていて、今の人のほとんどの人には合わないかも。",
                "published": "2023-02-06T09:16:25.349Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "inReplyTo": "https://misskey.dev/notes/9aw5wj8zyj",
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw5wj8zyj/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T09:15:33.875Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw5wj8zyj",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>定本 Cプログラマのためのアルゴリズムとデータ構造 (SOFTBANK BOOKS) | 近藤 嘉雪 |本 | 通販 | Amazon </span><a href=\"https://www.amazon.co.jp/dp/4797304952/\">https://www.amazon.co.jp/dp/4797304952/</a><span><br><br>アルゴリズム関連の本というと、これぐらいしか読んだことないかも。</span></p>",
                "_misskey_content": "定本 Cプログラマのためのアルゴリズムとデータ構造 (SOFTBANK BOOKS) | 近藤 嘉雪 |本 | 通販 | Amazon https://www.amazon.co.jp/dp/4797304952/\n\nアルゴリズム関連の本というと、これぐらいしか読んだことないかも。",
                "published": "2023-02-06T09:15:33.875Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw0uqalu4/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T06:54:11.613Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw0uqalu4",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>起票されたISSA</span></p>",
                "_misskey_content": "起票されたISSA",
                "published": "2023-02-06T06:54:11.613Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw0tpl3tn/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T06:53:24.039Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw0tpl3tn",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": "ガベージコレクションの対象オブジェクトを壁紙にしてるよ",
                "content": "<p><span>自宅警備だけじゃなく、街も警備</span></p>",
                "_misskey_content": "自宅警備だけじゃなく、街も警備",
                "published": "2023-02-06T06:53:24.039Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [
                    {
                        "type": "Document",
                        "mediaType": "image/png",
                        "url": "https://s3.arkjp.net/dev/webpublic-94c51dc3-a8f7-4f60-9ec4-9f9d4e1d5fd7.png"
                    }
                ],
                "sensitive": true,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw0m3msnc/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T06:47:28.996Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw0m3msnc",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>ホーム画面の壁紙を好きなオブジェク子ちゃんにしてるの、人に見られたくないもんね（違</span></p>",
                "_misskey_content": "ホーム画面の壁紙を好きなオブジェク子ちゃんにしてるの、人に見られたくないもんね（違",
                "published": "2023-02-06T06:47:28.996Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "inReplyTo": "https://misskey.dev/notes/9aw0h8j2gm",
                "attachment": [],
                "sensitive": false,
                "tag": [
                    {
                        "type": "Mention",
                        "href": "https://misskey.dev/users/8w71lqh16y",
                        "name": "@nekononikukyu"
                    }
                ]
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9aw092933f/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-06T06:37:20.679Z",
            "object": {
                "id": "https://misskey.dev/notes/9aw092933f",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>オブジェクトが参照される範囲を限定する、っていうのみんな意識しないのかな？</span></p>",
                "_misskey_content": "オブジェクトが参照される範囲を限定する、っていうのみんな意識しないのかな？",
                "published": "2023-02-06T06:37:20.679Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9asy0t7nbu/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-04T03:11:37.955Z",
            "object": {
                "id": "https://misskey.dev/notes/9asy0t7nbu",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>理由とか説明を聞いて理解するタイプ、ソースコードだけで理解するタイプと居るような</span></p>",
                "_misskey_content": "理由とか説明を聞いて理解するタイプ、ソースコードだけで理解するタイプと居るような",
                "published": "2023-02-04T03:11:37.955Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9assenhpll/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-04T00:34:26.029Z",
            "object": {
                "id": "https://misskey.dev/notes/9assenhpll",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>YAGNI - Wikipedia </span><a href=\"https://ja.wikipedia.org/wiki/YAGNI\">https://ja.wikipedia.org/wiki/YAGNI</a><span><br><br></span><blockquote><span>\"You ain't gonna need it\"[1]、縮めて YAGNI とは、機能は実際に必要となるまでは追加しないのがよいとする、エクストリーム・プログラミングにおける原則である。</span></blockquote><span><br>今回の例は、「追加しよう」って言ってるわけじゃないしな。</span></p>",
                "_misskey_content": "YAGNI - Wikipedia https://ja.wikipedia.org/wiki/YAGNI\n\n> \"You ain't gonna need it\"[1]、縮めて YAGNI とは、機能は実際に必要となるまでは追加しないのがよいとする、エクストリーム・プログラミングにおける原則である。\n\n今回の例は、「追加しよう」って言ってるわけじゃないしな。",
                "published": "2023-02-04T00:34:26.029Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9ass6a8nbl/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-04T00:27:55.607Z",
            "object": {
                "id": "https://misskey.dev/notes/9ass6a8nbl",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>「〜という仕様に変わった場合」というのは、単に設計のイマイチさが、実際にどう現れるかの例を出したというふうにも捉えれる。</span></p>",
                "_misskey_content": "「〜という仕様に変わった場合」というのは、単に設計のイマイチさが、実際にどう現れるかの例を出したというふうにも捉えれる。",
                "published": "2023-02-04T00:27:55.607Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "inReplyTo": "https://misskey.dev/notes/9ass1tzctk",
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9ass1tzctk/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-04T00:24:27.912Z",
            "object": {
                "id": "https://misskey.dev/notes/9ass1tzctk",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>「もし、〜という仕様に変わった場合、ここで不都合が出てしまうので、今から作ろうとしているモノの仕様はこう変えたほうがいいかなと思いました」<br>「変わったら変わったときに考えればいいです。このことをYAGNIといいます。」<br><br>うーん、「〜という仕様に変わった場合」というワードに引っ張られて言葉尻を捉えてしまって「YAGNI」と勘違いしているように思えた。これ、設計段階で、色々な設計が思い浮かんで、Aという設計よりもBという設計のほうが良さそうって言っているようにも思えるんですよね。</span></p>",
                "_misskey_content": "「もし、〜という仕様に変わった場合、ここで不都合が出てしまうので、今から作ろうとしているモノの仕様はこう変えたほうがいいかなと思いました」\n「変わったら変わったときに考えればいいです。このことをYAGNIといいます。」\n\nうーん、「〜という仕様に変わった場合」というワードに引っ張られて言葉尻を捉えてしまって「YAGNI」と勘違いしているように思えた。これ、設計段階で、色々な設計が思い浮かんで、Aという設計よりもBという設計のほうが良さそうって言っているようにも思えるんですよね。",
                "published": "2023-02-04T00:24:27.912Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9as5k4j8gt/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-03T13:54:50.228Z",
            "object": {
                "id": "https://misskey.dev/notes/9as5k4j8gt",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>米百合？</span></p>",
                "_misskey_content": "米百合？",
                "published": "2023-02-03T13:54:50.228Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        },
        {
            "id": "https://misskey.dev/notes/9as4jb8lx7/activity",
            "actor": "https://misskey.dev/users/8w72bqn1gt",
            "type": "Create",
            "published": "2023-02-03T13:26:12.645Z",
            "object": {
                "id": "https://misskey.dev/notes/9as4jb8lx7",
                "type": "Note",
                "attributedTo": "https://misskey.dev/users/8w72bqn1gt",
                "summary": null,
                "content": "<p><span>新潟は、フルーツ大国でもある</span></p>",
                "_misskey_content": "新潟は、フルーツ大国でもある",
                "published": "2023-02-03T13:26:12.645Z",
                "to": [
                    "https://www.w3.org/ns/activitystreams#Public"
                ],
                "cc": [
                    "https://misskey.dev/users/8w72bqn1gt/followers"
                ],
                "attachment": [],
                "sensitive": false,
                "tag": []
            },
            "to": [
                "https://www.w3.org/ns/activitystreams#Public"
            ],
            "cc": [
                "https://misskey.dev/users/8w72bqn1gt/followers"
            ]
        }
    ],
    "prev": "https://misskey.dev/users/8w72bqn1gt/outbox?page=true&since_id=9awkfs8xv3",
    "next": "https://misskey.dev/users/8w72bqn1gt/outbox?page=true&until_id=9as4jb8lx7"
}
```

