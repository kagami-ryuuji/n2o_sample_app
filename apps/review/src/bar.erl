-module(bar).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

view() ->
  #panel {
    body=[
      #h1 { body = <<"Foo: Attack of Bar">> },
      #link { url = "/foo", body="Back to Foo" }
    ]
  }.
