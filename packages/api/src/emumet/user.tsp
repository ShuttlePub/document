import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../common/activitystreams.tsp";
import "../common/json-ld.tsp";
import "../common/status-code.tsp";
import "../common/header";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("user")
@route("/users/{id}")
namespace Emumet.UserAPI;

model Attachment {
  type: "PropertyValue";
  name: string;
  value: string;
}

@format("uuid")
scalar UserId extends string;

model UserResponse {
  `@context`: JsonLd.Context[];
  id: url;
  type: "Person";

  @doc("The user's display name")
  preferredUsername: string;

  inbox: url;
  outbox: url;
  followers: url;
  following: url;

  @doc("https://docs.joinmastodon.org/spec/activitypub/#featured")
  featured: url;

  summary: string;
  sharedInbox: url;
  endpoints: {
    sharedInbox: url;
  };

  @doc("https://www.w3.org/wiki/Activity_Streams_extensions#as:manuallyApprovesFollowers")
  manuallyApprovesFollowers: boolean;

  @doc("https://docs.joinmastodon.org/spec/activitypub/#discoverable")
  discoverable: boolean;

  @doc("https://docs.joinmastodon.org/spec/activitypub/#publicKey")
  publicKey: {
    @doc("$owner#main-key")
    id: url;

    type: "Key";
    owner: url;
    publicKeyPem: string;
  };

  attachment: Attachment[];

  @doc("header image")
  image: ActivityStreams.Image;

  icon: ActivityStreams.Image;
}

interface User {
  @summary("Get a user from id")
  @get
  get(
    @path
    id: UserId,
  ):
    | {
        ...StatusCode.Success;
        ...Header.ContentType.ActivityJson;

        @body
        body: UserResponse;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}

alias InsertableActivities =
  | (ActivityStreams.BaseObject<string> & ActivityStreams.WithContext)
  | ActivityStreams.FollowWithContext
  | ActivityStreams.DeleteWithContext
  | ActivityStreams.LikeWithContext
  | ActivityStreams.BlockWithContext
  | ActivityStreams.UndoWithContext
  | ActivityStreams.CreateWithContext
  | ActivityStreams.UpdateWithContext
  | ActivityStreams.DeleteWithContext
  | ActivityStreams.AnnounceWithContext;

@route("/inbox")
interface Inbox {
  @doc("Returns received activities")
  @useAuth(BearerAuth)
  @get
  get(
    ...Query.OrderedCollectionQueries,

    @path
    id: UserId,
  ):
    | {
        ...StatusCode.Success;
        ...Header.ContentType.ActivityJson;

        @body
        body: ActivityStreams.OrderedCollection | ActivityStreams.OrderedCollectionPage;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @post
  post(
    ...Header.HttpSignatures,

    @path
    id: UserId,

    @body
    body: InsertableActivities,
  ):
    | StatusCode.Success
    | StatusCode.Accepted
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}

@route("/outbox")
interface Outbox {
  @doc("Returns actor activities")
  @get
  get(
    ...Query.OrderedCollectionQueries,

    @path
    id: UserId,
  ):
    | {
        ...StatusCode.Success;
        ...Header.ContentType.ActivityJson;

        @body
        body: ActivityStreams.OrderedCollection | ActivityStreams.OrderedCollectionPage;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @post
  post(
    ...Header.HttpSignatures,

    @path
    id: UserId,

    @body
    body: InsertableActivities,
  ):
    | StatusCode.Success
    | StatusCode.Accepted
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}
