module Main where

import System.Random (randomRIO)
import Data.List (sort)
import Control.Concurrent (threadDelay)
import GameOfLife.Cell (Cell(..))
import GameOfLife.GameBoard (GameBoard(..))
import GameOfLife.Position (Position(..))
import GameOfLife.Visualizer (visualize)
import GameOfLife.Evolution (evolve)

main :: IO ()
main = do
  board <- GameBoard <$> seedCells
  display 1 board

type Round = Int
display :: Round -> GameBoard -> IO ()
display round board = do
  clearScreen
  putStrLn $ "Round: " ++ show round
  putStrLn $ visualize board
  let evolvedBoard = evolve board
  putStrLn $ "Boards converged? " ++ show (board == evolvedBoard)
  threadDelay 250000
  display (round +1)$ evolve board

clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"

seedCells :: IO [Cell]
seedCells = sequence $ map createCell seedPositions

createCell :: Position -> IO Cell
createCell position = randomCell <**> position

seedPositions :: [Position]
seedPositions = sort [Position x y | x <- [0..40], y <- [0..40]]

randomCell :: IO (Position -> Cell)
randomCell = toCell <$> zeroOrOne
  where
    zeroOrOne = randomRIO (0, 1) :: IO Int
    toCell 0 = DeadCell
    toCell 1 = LivingCell




(<**>) :: (Applicative f) => f (a -> b) -> a -> f b
(<**>) f a = f <*> pure a
