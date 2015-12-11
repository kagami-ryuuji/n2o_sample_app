-module(bar).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

view() ->
  #panel {
    body=[
      #h1 { body = <<"Foo: Attack of Bar">> },
      #button { id=baz, postback={show, baz}, body= <<"Gallery list">> },
      #button { id=foo, postback={show, foo}, body= <<"Back to the Foo">> }
    ]
  }.

push_state() ->
  "window.history.pushState({page: 'bar'}, '', '/bar');".
