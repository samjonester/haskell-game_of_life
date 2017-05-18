module GameOfLife.Position ( Position(..)
                           , isNeighbour
                           , display
                           ) where

type X = Int
type Y = Int

data Position = Position X Y
  deriving
    Show

instance Eq Position where
  (==) (Position x1 y1) (Position x2 y2) = x1 == x2 && y1 == y2

instance Ord Position where
  compare (Position x1 y1) (Position x2 y2)
    | y1 < y2   = LT
    | y1 > y2   = GT
    | otherwise = compare x1 x2

isNeighbour :: Position -> Position -> Bool
isNeighbour (Position x1 y1) (Position x2 y2)
  | x1 == x2 && abs (y1 - y2) == 1  = True
  | y1 == y2 && abs (x1 - x2) == 1  = True
  | otherwise                       = False


display :: Position -> String
display (Position 0 0) = ""
display (Position 0 _) = "\n"
display (Position _ _) = ""
