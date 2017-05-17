module GameOfLife.RulesSpec where

import Test.Hspec
import GameOfLife.Rules (
        Cell(..)
        , transitionCell)

spec :: Spec
spec = do
  describe "rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." $ do
    it "should die with one living neighbours" $ do
      show (transitionCell LivingCell [LivingCell, DeadCell, DeadCell, DeadCell]) `shouldBe` show DeadCell
    it "should die with zero living neighbours" $ do
      show (transitionCell LivingCell [DeadCell, DeadCell, DeadCell, DeadCell]) `shouldBe` show DeadCell
  describe "rule 2: Any live cell with two or three live neighbours lives on to the next generation." $ do
    it "should live with two living neighbours" $ do
      show (transitionCell LivingCell [LivingCell, LivingCell, DeadCell, DeadCell]) `shouldBe` show LivingCell
    it "should live with three living neighbours" $ do
      show (transitionCell LivingCell [LivingCell, LivingCell, LivingCell, DeadCell]) `shouldBe` show LivingCell
  describe "rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding." $ do
    it "should die with four living neighbours" $ do
      show (transitionCell LivingCell [LivingCell, LivingCell, LivingCell, LivingCell]) `shouldBe` show DeadCell
  describe "rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." $ do
    it "should come alive with three living neighbours" $ do
      show (transitionCell DeadCell [LivingCell, LivingCell, LivingCell, DeadCell]) `shouldBe` show LivingCell
    it "should remain dead with four living neighbours" $ do
      show (transitionCell DeadCell [LivingCell, LivingCell, LivingCell, LivingCell]) `shouldBe` show DeadCell
    it "should remain dead with two living neighbours" $ do
      show (transitionCell DeadCell [LivingCell, LivingCell, DeadCell, DeadCell]) `shouldBe` show DeadCell
    it "should remain dead with one living neighbours" $ do
      show (transitionCell DeadCell [LivingCell, DeadCell, DeadCell, DeadCell]) `shouldBe` show DeadCell
    it "should remain dead with zero living neighbours" $ do
      show (transitionCell DeadCell [DeadCell, DeadCell, DeadCell, DeadCell]) `shouldBe` show DeadCell

