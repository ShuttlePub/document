import "@typespec/http";
import "./account.tsp";

using TypeSpec.Http;

@useAuth(BearerAuth)
@route("/api/[apiVersion]")
namespace Emumet.API;
