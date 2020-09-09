-- SYNTAX TEST "Packages/Haskell/Haskell.sublime-syntax"

23*36  -- single line comment
--     ^^ punctuation.definition.comment.haskell
--     ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.haskell
23*36
-- <- - comment.line.double-dash.haskell

   {- block comment -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^^^^^^^^^ comment.block.haskell
--                  ^^ punctuation.definition.comment.end.haskell
--                    ^ - comment.block.haskell

   {- {-# #-} -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--            ^^ punctuation.definition.comment.end.haskell
--              ^ - comment.block.haskell

   {- {- #-} -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^^ comment.block.haskell
--           ^^ punctuation.definition.comment.end.haskell
--             ^ - comment.block.haskell

   {- {- -} -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^ comment.block.haskell
--          ^^ punctuation.definition.comment.end.haskell
--            ^ - comment.block.haskell

   {- {-# -} -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--           ^^ punctuation.definition.comment.end.haskell
--             ^ - comment.block.haskell

   {- {-# {- test -} -} -} 23*36
-- ^^ punctuation.definition.comment.begin.haskell
-- ^^^^^^^^^^^^^^^^^^^^^^^ comment.block.haskell - meta.preprocessor.haskell
--                      ^^ punctuation.definition.comment.end.haskell
--                        ^ - comment.block.haskell

   class (Functor t, Foldable t) => Traversable t where
-- ^^^^^ keyword.other.haskell
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.declaration.class.haskell
   {-# MINIMAL traverse | sequenceA LANGUAGE #-}
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.preprocessor.haskell
--                                              ^ - meta.preprocessor.haskell
--                                   ^^^^^^^ keyword.other.preprocessor.haskell

-- | Map each element of a structure to an action,
-- evaluate these actions from left to right, and
-- collect the results. For a version that ignores
-- the results see 'Data.Foldable.traverse_'.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.haskell

   traverse :: Applicative f =>
-- ^^^^^^^^ entity.name.function.haskell
--          ^^ keyword.other.double-colon.haskell
--             ^^^^^^^^^^^ storage.type.haskell
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
--                           ^^ keyword.other.big-arrow.haskell
    (a -> f b)
-- ^^^^^^^^^^^^ meta.function.type-declaration.haskell
--     ^^ keyword.other.arrow.haskell
    -> t a
-- ^^^^^^^^ meta.function.type-declaration.haskell
--  ^^ keyword.other.arrow.haskell
    -> f (t b)
-- ^^^^^^^^^^^^ meta.function.type-declaration.haskell
--  ^^ keyword.other.arrow.haskell
   traverse f = sequenceA . fmap f
-- ^^^^^^^^^^^^^ meta.function.type-declaration.haskell
--            ^ keyword.operator.haskell
--                        ^ keyword.operator.haskell

-- | Evaluate each action in the structure from
-- left to right, and collect the results.
-- For a version that ignores the results see
-- 'Data.Foldable.sequenceA_'.
   sequenceA ∷ Applicative f ⇒ t (f a) → f (t a)
-- ^^^^^^^^^ entity.name.function.haskell
--           ^ keyword.other.double-colon.haskell
--             ^^^^^^^^^^^ storage.type.haskell
--                           ^ keyword.other.big-arrow.haskell
--                                     ^ keyword.other.arrow.haskell
   sequenceA = traverse id
--           ^ keyword.operator.haskell

--
-- deriving
--

   deriving Foo
-- ^^^^^^^^^^^^ meta.deriving.haskell
-- ^^^^^^^^ keyword.other.haskell
--          ^^^ entity.other.inherited-class.haskell


   deriving ( Foo
-- ^^^^^^^^^^^^^^ meta.deriving.haskell
    , Bar )
-- ^^^^^^^^ meta.deriving.haskell


deriving stock Foo
--       ^^^^^ keyword.other.haskell

deriving anyclass Foo
--       ^^^^^^^ keyword.other.haskell

deriving newtype Foo
--       ^^^^^^^ keyword.other.haskell

deriving Foo via Const Bar
deriving (Foo) via (Const Identity)
deriving (Foo,
   Bar) via (Const Identity)



--
-- infix operators
--
   a a = (+) a 2
--     ^ keyword.operator.haskell
--       ^^^ entity.name.function.infix.haskell
--             ^ constant.numeric.haskell
   a a = (-) a 2
--     ^ keyword.operator.haskell
--       ^^^ entity.name.function.infix.haskell
--             ^ constant.numeric.haskell
   a a = (*) a 2
--     ^ keyword.operator.haskell
--       ^^^ entity.name.function.infix.haskell
--             ^ constant.numeric.haskell
   a a = (/) a 2
--     ^ keyword.operator.haskell
--       ^^^ entity.name.function.infix.haskell
--             ^ constant.numeric.haskell

   a a = 2 `add` 2
--     ^ keyword.operator.haskell
--         ^   ^ punctuation.definition.entity.haskell
--          ^^^  keyword.operator.function.infix.haskell

   a a = 2 `add1` 2
--     ^ keyword.operator.haskell
--         ^      punctuation.definition.entity.haskell
--          ^^^^  keyword.operator.function.infix.haskell
--              ^ punctuation.definition.entity.haskell


   a a = 2 `Int.add` 2
--     ^ keyword.operator.haskell
--         ^       ^ punctuation.definition.entity.haskell
--          ^^^^^^^  keyword.operator.function.infix.haskell

--
-- module names vs. constructor names
--

foo = Foo
--    ^^^ constant.other.haskell

foo = Module.Inner.Ctor
--    ^^^^^^ support.other.module.haskell
--           ^^^^^ support.other.module.haskell
--                 ^^^^ constant.other.haskell

foo = Module.Inner.function
--    ^^^^^^ support.other.module.haskell
--           ^^^^^ support.other.module.haskell

foo = Ctor . var
--    ^^^^ constant.other.haskell
--         ^ keyword.operator.haskell


   quant :: forall x y. x -> Int
--          ^^^^^^ keyword.other.forall.haskell
--                    ^ keyword.other.forall.haskell

   quant :: forall x, y. -> Int
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.type-declaration.haskell
-- ^^^^^ entity.name.function.haskell
--                  ^ invalid.illegal.comma-in-forall.haskell


--
-- Quasi-quotation
--

a = [quasi0'| hello |]
a = [Int.quasi0'| hello |]
a = [| hello |]

ml_string = "Hello \
            \world\
            \!"

bad_string = "hello

asdf
