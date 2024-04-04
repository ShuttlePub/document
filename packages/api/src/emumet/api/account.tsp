import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/status-code.tsp";
import "../../common/query";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("account")
@route("/accounts")
namespace Emumet.API.AccountAPI;

@format("uuid")
scalar AccountId extends string;

model AccountCreateRequest {
  name: string;
  is_bot: boolean;
}

model AccountResponse {
  id: AccountId;
  name: string;
  publicKey: string;
  is_bot: boolean;
  created_at: string;
}

interface Accounts {
  @summary("Get all your accounts")
  @get
  get(...Query.ArrayLimitQueries<DefaultLimit = 5>): {
    ...StatusCode.Success;

    @body
    body: AccountResponse[];
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Create a new account")
  @post
  create(@body request: AccountCreateRequest): {
    ...StatusCode.Success;

    @body
    body: AccountId;
  } | StatusCode.BadRequest | StatusCode.InternalError;
}

@route("/{id}")
namespace Account {
  @summary("Get an account")
  @get
  op get(@path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountResponse;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Delete an account")
  @delete
  op delete(@path id: AccountId): {
    ...StatusCode.Success;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Get follows")
  @route("/follows")
  @get
  op getFollows(...Query.ArrayLimitQueries, @path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountId[];
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Get followers")
  @route("/followers")
  @get
  op getFollowers(...Query.ArrayLimitQueries, @path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountId[];
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @route("/blocks")
  interface Block {
    @get
    get(...Query.ArrayLimitQueries, @path id: AccountId): {
      ...StatusCode.Success;

      @body
      body: AccountId[];
    } | StatusCode.BadRequest | StatusCode.InternalError;

    @post
    post(
      @path id: AccountId,
      target: AccountId,
    ): StatusCode.Success | StatusCode.BadRequest | StatusCode.InternalError;

    @delete
    delete(
      @path id: AccountId,
      target: AccountId,
    ): StatusCode.Success | StatusCode.BadRequest | StatusCode.InternalError;
  }

  @route("/mutes")
  interface Mute {
    @get
    get(...Query.ArrayLimitQueries, @path id: AccountId): {
      ...StatusCode.Success;

      @body
      body: AccountId[];
    } | StatusCode.BadRequest | StatusCode.InternalError;

    @post
    post(
      @path id: AccountId,
      target: AccountId,
    ): StatusCode.Success | StatusCode.BadRequest | StatusCode.InternalError;

    @delete
    delete(
      @path id: AccountId,
      target: AccountId,
    ): StatusCode.Success | StatusCode.BadRequest | StatusCode.InternalError;
  }
}
