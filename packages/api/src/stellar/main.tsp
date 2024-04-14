import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

@service({
    title: "Stellar Authentication API",
})
@server("/", "Stellar root endpoint")
@versioned(StellarVersion)
namespace Stellar;

enum StellarVersion {
    v1
}