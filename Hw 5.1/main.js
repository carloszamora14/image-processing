function applyMorphologicalOp(matrix, se, pivot, func) {
  const [pivotRow, pivotCol] = pivot;
  const numRows = matrix.length;
  const numCols = matrix[0].length;
  const result = matrix.map(row => row.map(() => 0));

  for (let i = 0; i < numRows; i++) {
    for (let j = 0; j < numCols; j++) {
      let newVal = null;

      for (let di = -pivotRow; di < -pivotRow + se.length; di++) {
        for (let dj = -pivotCol; dj < -pivotCol + se[0].length; dj++) {
          if (se[di + pivotRow][dj + pivotCol] === 0) continue;

          const row = i + di;
          const col = j + dj;

          if (row < 0 || row >= numRows || col < 0 || col >= numCols) continue;

          newVal = func(matrix[row][col], newVal);
        }
      }

      result[i][j] = newVal;
    }
  }

  return result;
}

const a = [
  [0, 1, 1, 0, 1, 0],
  [1, 1, 1, 0, 0, 1],
  [1, 1, 0, 1, 0, 1],
  [1, 1, 1, 0, 0, 0],
  [0, 1, 1, 1, 0, 1],
  [0, 0, 1, 0, 0, 0],
];

const b = [
  [35, 1, 6, 26, 19, 24],
  [3, 32, 7, 21, 23, 25],
  [31, 9, 2, 22, 27, 20],
  [8, 28, 33, 17, 10, 15],
  [30, 15, 13, 12, 14, 16],
  [4, 36, 29, 13, 18, 11],
];

const se1 = [
  [0, 1, 0],
  [1, 1, 1],
  [0, 1, 0],
];

const pivot1 = [1, 1];

const se2 = [
  [0, 1],
  [1, 0],
];

const pivot2 = [1, 0];

function dilatation(curr, prev) {
  return prev === null ? curr : Math.max(curr, prev);
}

function erosion(curr, prev) {
  return prev === null ? curr : Math.min(curr, prev);
}

console.log(
  'Dilatation of A with se1:',
  applyMorphologicalOp(a, se1, pivot1, dilatation)
);
console.log(
  'Erosion of A with se1:',
  applyMorphologicalOp(a, se1, pivot1, erosion)
);
console.log(
  'Dilatation of B with se1:',
  applyMorphologicalOp(b, se1, pivot1, dilatation)
);
console.log(
  'Erosion of B with se1:',
  applyMorphologicalOp(b, se1, pivot1, erosion)
);
console.log(
  'Dilatation of A with se2:',
  applyMorphologicalOp(a, se2, pivot2, dilatation)
);
console.log(
  'Erosion of A with se2:',
  applyMorphologicalOp(a, se2, pivot2, erosion)
);
console.log(
  'Dilatation of B with se2:',
  applyMorphologicalOp(b, se2, pivot2, dilatation)
);
console.log(
  'Erosion of B with se2:',
  applyMorphologicalOp(b, se2, pivot2, erosion)
);
