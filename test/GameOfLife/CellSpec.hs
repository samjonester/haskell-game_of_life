module GameOfLife.CellSpec where

import Test.Hspec
import Data.List (sort)
import GameOfLife.Cell (Cell(..), isNeighbour, display)
import GameOfLife.Position (Position(..))

spec :: Spec
spec = describe "Cell" $ do
  it "should be a neighbour" $ do
    let cell = LivingCell $ Position 2 2
    let neighbour = LivingCell $ Position 1 2
    isNeighbour cell neighbour `shouldBe` True

  it "should sort" $ do
    sort [LivingCell (Position 1 1), LivingCell (Position 0 0)]
      `shouldBe`
        [LivingCell (Position 0 0), LivingCell (Position 1 1)]

  describe "displaying cells" $ do
    it "should display X for LivingCell" $ do
      let cell = LivingCell (Position 1 1)
      display cell `shouldBe` "X"

    it "should display for DeadCell" $ do
      let cell = DeadCell (Position 1 1)
      display cell `shouldBe` " "
