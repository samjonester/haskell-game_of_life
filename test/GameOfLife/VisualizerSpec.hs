module GameOfLife.VisualizerSpec where

import Test.Hspec
import GameOfLife.Cell
import GameOfLife.Position
import GameOfLife.GameBoard
import GameOfLife.Visualizer (visualize)

spec :: Spec
spec = describe "Visualizing a gameboard" $ do
  it "should print the gameboard" $ do
    let board = GameBoard [ LivingCell (Position 0 0), DeadCell (Position 1 0)
                          , DeadCell (Position 0 1), LivingCell (Position 1 1) ]
    visualize board `shouldBe` "X \n X"
