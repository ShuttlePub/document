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
interface Account {
  @summary("Get an account")
  @get
  get(@path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountResponse;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Delete an account")
  @delete
  delete(@path id: AccountId): {
    ...StatusCode.Success;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Get follows")
  @route("/follows")
  @get
  getFollows(...Query.ArrayLimitQueries, @path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountId[];
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @summary("Get followers")
  @route("/followers")
  @get
  getFollowers(...Query.ArrayLimitQueries, @path id: AccountId): {
    ...StatusCode.Success;

    @body
    body: AccountId[];
  } | StatusCode.BadRequest | StatusCode.InternalError;
}
