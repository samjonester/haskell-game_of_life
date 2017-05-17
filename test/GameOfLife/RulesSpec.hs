module GameOfLife.RulesSpec where

import Test.Hspec
import GameOfLife.Cell
import GameOfLife.Position
import GameOfLife.Rules (transitionCell)

p = Position 0 0

spec :: Spec
spec = do
  describe "rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." $ do
    it "should die with one living neighbours" $ do
      let cell = LivingCell p
      let neighbours = [LivingCell p, DeadCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)

    it "should die with zero living neighbours" $ do
      let cell = LivingCell p
      let neighbours = [DeadCell p, DeadCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)


  describe "rule 2: Any live cell with two or three live neighbours lives on to the next generation." $ do
    it "should live with two living neighbours" $ do
      let cell = LivingCell p
      let neighbours = [LivingCell p, LivingCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (LivingCell p)

    it "should live with three living neighbours" $ do
      let cell = LivingCell p
      let neighbours = [LivingCell p, LivingCell p, LivingCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (LivingCell p)


  describe "rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding." $ do
    it "should die with four living neighbours" $ do
      let cell = LivingCell p
      let neighbours = [LivingCell p, LivingCell p, LivingCell p, LivingCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)


  describe "rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." $ do
    it "should come alive with three living neighbours" $ do
      let cell = DeadCell p
      let neighbours = [LivingCell p, LivingCell p, LivingCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (LivingCell p)

    it "should remain dead with four living neighbours" $ do
      let cell = DeadCell p
      let neighbours = [LivingCell p, LivingCell p, LivingCell p, LivingCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)

    it "should remain dead with two living neighbours" $ do
      let cell = DeadCell p
      let neighbours = [LivingCell p, LivingCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)

    it "should remain dead with one living neighbours" $ do
      let cell = DeadCell p
      let neighbours = [LivingCell p, DeadCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)

    it "should remain dead with zero living neighbours" $ do
      let cell = DeadCell p
      let neighbours = [DeadCell p, DeadCell p, DeadCell p, DeadCell p]
      show (transitionCell neighbours cell) `shouldBe` show (DeadCell p)
