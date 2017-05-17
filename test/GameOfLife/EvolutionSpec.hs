module GameOfLife.EvolutionSpec where

import Test.Hspec
import GameOfLife.Cell
import GameOfLife.GameBoard
import GameOfLife.Position
import GameOfLife.Evolution (evolve)

spec :: Spec
spec = describe  "Gamboard evolution" $ do
  it "should evolve each cell" $ do
    let board = GameBoard [ DeadCell (Position 0 0), DeadCell (Position 0 1)
                          , DeadCell (Position 1 0), DeadCell (Position 1 1) ]
    let (GameBoard newCells) = evolve board
    show newCells `shouldBe` show [ DeadCell (Position 0 0), DeadCell (Position 0 1)
                          , DeadCell (Position 1 0), DeadCell (Position 1 1) ]
