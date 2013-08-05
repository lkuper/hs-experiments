data Tree a = Leaf a
          | InnerNode (Tree a) (Tree a)

-- Returns the max depth of the tree.
depth :: (Tree a) -> Int
depth t = case t of
  Leaf _ -> 0
  InnerNode t1 t2 -> 1 + (max (depth t1) (depth t2))

-- According to rumor, the only way to get `depth` to be
-- tail-recursive is to CPS it.  Is that true?

