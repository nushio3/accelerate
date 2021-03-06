{-# LANGUAGE GADTs, FlexibleInstances, TypeSynonymInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_HADDOCK hide #-}
-- |
-- Module      : Data.Array.Accelerate.Pretty
-- Copyright   : [2008..2011] Manuel M T Chakravarty, Gabriele Keller, Sean Lee
--               [2009..2012] Manuel M T Chakravarty, Gabriele Keller, Trevor L. McDonell
-- License     : BSD3
--
-- Maintainer  : Manuel M T Chakravarty <chak@cse.unsw.edu.au>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--

module Data.Array.Accelerate.Pretty (

  -- * Pretty printing functions
  module Data.Array.Accelerate.Pretty.Print

  -- * Instances of Show

) where

-- standard libraries
import Text.PrettyPrint

-- friends
import Data.Array.Accelerate.Pretty.Print
import Data.Array.Accelerate.AST

-- |Show instances
-- ---------------

wide :: Style
wide = style { lineLength = 150 }

instance Show (OpenAcc aenv a) where
  show c = renderStyle wide $ prettyAcc 0 noParens c

instance Show (OpenAfun aenv f) where
  show f = renderStyle wide $ prettyAfun 0 f

instance Show (OpenFun env aenv f) where
  show f = renderStyle wide $ prettyFun 0 f

instance Show (OpenExp env aenv t) where
  show e = renderStyle wide $ prettyExp 0 0 noParens e

