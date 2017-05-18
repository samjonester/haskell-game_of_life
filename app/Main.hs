module Main where

import System.Random (randomRIO)
import GameOfLife.Cell (Cell(..))
import GameOfLife.GameBoard (GameBoard(..))
import GameOfLife.Position (Position(..))
import GameOfLife.Visualizer (visualize)
import GameOfLife.Evolution (evolve)

main :: IO ()
main = display =<< GameBoard <$> seedCells

display :: GameBoard -> IO ()
display board = do
  putStrLn $ visualize board
  display $ evolve board

seedCells :: IO [Cell]
seedCells = sequence $ map createCell seedPositions

createCell :: Position -> IO Cell
createCell position = randomCell <**> position

seedPositions :: [Position]
seedPositions = [Position x y | x <- [0..10], y <- [0..10]]

randomCell :: IO (Position -> Cell)
randomCell = toCell <$> zeroOrOne
  where
    zeroOrOne = randomRIO (0, 1) :: IO Int
    toCell 0 = DeadCell
    toCell 1 = LivingCell




(<**>) :: (Applicative f) => f (a -> b) -> a -> f b
(<**>) f a = f <*> pure a
