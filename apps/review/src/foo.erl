-module(foo).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

view() ->
  #panel {
    body=[
      #h1 { body = <<"Foo: Begin">> },
      #link { url = "/bar", body="Forward to Bar" }
    ]
  }.
