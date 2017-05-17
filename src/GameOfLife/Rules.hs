module GameOfLife.Rules (
                          Cell(..)
                        , transitionCell) where

data Cell = LivingCell | DeadCell
  deriving Show

type Neighbours = [Cell]

living :: Neighbours -> Neighbours
living neighbours = [ x | x@(LivingCell) <- neighbours ]

transitionCell :: Cell -> Neighbours -> Cell
transitionCell LivingCell neighbours
    | length (living neighbours) > 3   = DeadCell
    | length (living neighbours) >= 2  = LivingCell
    | otherwise                        = DeadCell
transitionCell DeadCell neighbours
    | length (living neighbours) == 3  = LivingCell
    | otherwise                        = DeadCell
