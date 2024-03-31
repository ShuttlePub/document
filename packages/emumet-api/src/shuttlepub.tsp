import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

@service({
  title: "ShuttlePub REST API",
})
@server("/", "ShuttlePub flagship server endpoint")
@versioned(ShuttlePubVersions)
namespace ShuttlePub;

enum ShuttlePubVersions {
  v1,
}
