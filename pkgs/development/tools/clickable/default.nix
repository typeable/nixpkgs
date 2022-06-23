{ lib
, fetchFromGitLab
, buildPythonPackage
, cookiecutter
, requests
, pyyaml
, jsonschema
, argcomplete
}:

buildPythonPackage rec {
  pname = "clickable";
  version = "7.4.0";

  src = fetchFromGitLab {
    owner = "clickable";
    repo = "clickable";
    rev = "v${version}";
    sha256 = "sha256-QS7vi0gUQbqqRYkZwD2B+zkt6DQ6AamQO7sihD8qWS0=";
  };

  propagatedBuildInputs = [
    cookiecutter
    requests
    pyyaml
    jsonschema
    argcomplete
  ];

  # Logging test don't run with error:
  #   TypeError: don't know how to make test from: <Logger clickable (DEBUG)>
  doCheck = false;

  meta = {
    description = "A build system for Ubuntu Touch apps";
    homepage = "https://clickable-ut.dev";
    changelog = "https://clickable-ut.dev/en/latest/changelog.html";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ilyakooo0 ];
  };
}
