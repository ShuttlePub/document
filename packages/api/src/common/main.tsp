namespace Common;

model Types {
  @doc("https://datatracker.ietf.org/doc/html/rfc3987#section-2")
  IRI: url | string = "http://schema.org/url";
}

@doc("https://github.com/ulid/spec")
@format("uuid")
scalar ULID extends string;
