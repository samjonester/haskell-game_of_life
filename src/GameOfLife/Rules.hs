module GameOfLife.Rules (transitionCell) where

import GameOfLife.Cell

type Neighbours = [Cell]

living :: Neighbours -> Neighbours
living neighbours = [ x | x@(LivingCell _) <- neighbours ]

transitionCell :: Neighbours -> Cell -> Cell
transitionCell neighbours (LivingCell pos)
    | length (living neighbours) > 3   = DeadCell pos
    | length (living neighbours) >= 2  = LivingCell pos
    | otherwise                        = DeadCell pos
transitionCell neighbours (DeadCell pos)
    | length (living neighbours) == 3  = LivingCell pos
    | otherwise                        = DeadCell pos
