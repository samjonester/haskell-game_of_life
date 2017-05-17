module GameOfLife.CellSpec where

import Test.Hspec
import GameOfLife.Cell
import GameOfLife.Position (Position(..))

spec :: Spec
spec = describe "Cell neighbours" $ do
  it "should be a neighbour" $ do
    let cell = LivingCell $ Position 2 2
    let neighbour = LivingCell $ Position 1 2
    isNeighbour cell neighbour `shouldBe` True
