function nextGeneration(field) {
    assignNextGenValues(field);
    drawNextGen(field);
}

function assignNextGenValues(field) {
    for (var i = 0; i < field.rows; i++) {
        for (var j = 0; j < field.columns; j++) {
            var cell = getChild(field, i, j);
            var neighbors = aliveNeighbors(i, j, field);

            cell.nextGen = willLive(neighbors, cell.isAlive);
        }
    }
}

function drawNextGen(field) {
    for (var i = 0; i < field.rows; i++) {
        for (var j = 0; j < field.columns; j++) {
            var cell = getChild(field, i, j);
            cell.isAlive = cell.nextGen;
            changeColor(cell);
        }
    }
}

function changeColor(cell) {
    if (cell.isAlive)
        cell.color = "cornflowerblue"
    else
        cell.color = "lightgray"
}

function aliveNeighbors(r, c, field) {
    var neighbors = 0

    for (var i = r - 1; i <= r + 1; i++) {
        for (var j = c - 1; j <= c + 1; j++) {
            if ((i == r && j == c) || !isNeighborInLimits(field, i, j) )
                continue;
            var cell = getChild(field, i, j);
            if (cell != null && cell.isAlive)
                neighbors++;
        }
    }

    return neighbors;
}


function isNeighborInLimits(field,neighborRow, neighborColumn) {
    if (neighborColumn < 0 || neighborColumn == field.columns ||
            neighborRow < 0 || neighborRow == field.rows)
        return false;
    else
        return true;
}

function willLive(livingNeighbors, isAlive) {
    if (isAlive && livingNeighbors < 2)
        return false;
    if (isAlive && (livingNeighbors == 2 || livingNeighbors == 3))
        return true;
    if (isAlive && livingNeighbors > 3)
        return false;
    if (!isAlive && livingNeighbors == 3)
        return true;

    return false;
}

function getChild(field, row, column) {
    var it = row * field.rows + column;
    return field.children[it];
}


