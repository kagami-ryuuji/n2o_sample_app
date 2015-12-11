-module(baz).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

view() ->
  [
    #h1 { body = <<"Galleries">> },
    #button { id=baz, postback={show, baz}, body= <<"Gallery list">> },
    #button { id=foo, postback={show, foo}, body= <<"Foo">> },
    #button { id=bar, postback={show, bar}, body= <<"Bar">> }
  ].

push_state() ->
  "window.history.pushState({page: 'baz'}, '', '/');".
