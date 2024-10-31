namespace Common.Types;

@example("http://schema.org/url")
@doc("https://datatracker.ietf.org/doc/html/rfc3987#section-2")
scalar IRI extends url;

@example("V1StGXR8_Z5jdHi6B-myT")
@doc("https://github.com/ai/nanoid")
scalar Nanoid extends string;
