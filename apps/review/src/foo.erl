-module(foo).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

view() ->
  #panel {
    body=[
      #h1 { body = <<"Foo: Begin">> },
      #button { id=baz, postback={show, baz}, body= <<"Gallery list">> },
      #button { id=bar, postback={show, bar}, body= <<"Bar">> }
    ]
  }.

push_state() ->
  "window.history.pushState({page: 'foo'}, '', '/foo');".
