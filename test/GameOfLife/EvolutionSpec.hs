module GameOfLife.EvolutionSpec where

import Test.Hspec
import Data.List (sort)
import GameOfLife.Cell
import GameOfLife.GameBoard
import GameOfLife.Position
import GameOfLife.Evolution (evolve)

board = GameBoard [ DeadCell (Position 0 0),   LivingCell (Position 1 0), DeadCell (Position 2 0),   DeadCell (Position 3 0)
                  , LivingCell (Position 0 1), DeadCell (Position 1 1),   DeadCell (Position 2 1),   DeadCell (Position 3 1)
                  , DeadCell (Position 0 2),   LivingCell (Position 1 2), DeadCell (Position 2 2),   DeadCell (Position 3 2)
                  , DeadCell (Position 0 3),   DeadCell (Position 1 3),   DeadCell (Position 2 3),   DeadCell (Position 3 3) ]

spec :: Spec
spec = describe  "Gamboard evolution" $ do
  it "should evolve each cell" $ do
    let (GameBoard newCells) = evolve board
    sort newCells `shouldBe` sort [ DeadCell (Position 0 0),   DeadCell (Position 1 0),   DeadCell (Position 2 0),   DeadCell (Position 3 0)
                                  , DeadCell (Position 0 1),   LivingCell (Position 1 1), DeadCell (Position 2 1),   DeadCell (Position 3 1)
                                  , DeadCell (Position 0 2),   DeadCell (Position 1 2),   DeadCell (Position 2 2),   DeadCell (Position 3 2)
                                  , DeadCell (Position 0 3),   DeadCell (Position 1 3),   DeadCell (Position 2 3),   DeadCell (Position 3 3) ]

  it "should not be equal to original board" $ do
    let newBoard = evolve board
    newBoard == board `shouldBe` False
