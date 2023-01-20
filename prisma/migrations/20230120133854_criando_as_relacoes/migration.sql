-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_HabitWeekDays" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "HabitWeekDays_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_HabitWeekDays" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "HabitWeekDays";
DROP TABLE "HabitWeekDays";
ALTER TABLE "new_HabitWeekDays" RENAME TO "HabitWeekDays";
CREATE UNIQUE INDEX "HabitWeekDays_habit_id_week_day_key" ON "HabitWeekDays"("habit_id", "week_day");
CREATE TABLE "new_day_habtis" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "day_habtis_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "day_habtis_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_day_habtis" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "day_habtis";
DROP TABLE "day_habtis";
ALTER TABLE "new_day_habtis" RENAME TO "day_habtis";
CREATE UNIQUE INDEX "day_habtis_day_id_habit_id_key" ON "day_habtis"("day_id", "habit_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;