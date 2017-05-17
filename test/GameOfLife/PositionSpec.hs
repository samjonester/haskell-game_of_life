module GameOfLife.PositionSpec where

import Test.Hspec
import GameOfLife.Position

spec :: Spec
spec = describe "Position neighbours" $ do
  it "should be a neighbour to the left" $ do
    let position = Position 2 2
    let neighbour = Position 1 2
    isNeighbour position neighbour `shouldBe` True

  it "should be a neighbour to the right" $ do
    let position = Position 2 2
    let neighbour = Position 3 2
    isNeighbour position neighbour `shouldBe` True

  it "should be a neighbour to the top" $ do
    let position = Position 2 2
    let neighbour = Position 2 1
    isNeighbour position neighbour `shouldBe` True

  it "should be a neighbour to the bottom" $ do
    let position = Position 2 2
    let neighbour = Position 2 3
    isNeighbour position neighbour `shouldBe` True

  it "should not be a neighbour to the left" $ do
    let position = Position 2 2
    let neighbour = Position 0 2
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the right" $ do
    let position = Position 2 2
    let neighbour = Position 4 0
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the top" $ do
    let position = Position 2 2
    let neighbour = Position 2 0
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the bottom" $ do
    let position = Position 2 2
    let neighbour = Position 2 4
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the top left" $ do
    let position = Position 2 2
    let neighbour = Position 1 1
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the top right" $ do
    let position = Position 2 2
    let neighbour = Position 3 1
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the bottom left" $ do
    let position = Position 2 2
    let neighbour = Position 1 3
    isNeighbour position neighbour `shouldBe` False

  it "should not be a neighbour to the bottom right" $ do
    let position = Position 2 2
    let neighbour = Position 3 3
    isNeighbour position neighbour `shouldBe` False
