/*
  Warnings:

  - The primary key for the `Session` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `accountOwner` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `collaborator` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `emailVerified` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `expires` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `isOnline` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `locale` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `scope` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `state` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Session` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - Added the required column `updatedAt` to the `Session` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Session" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "shop" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Session" ("accessToken", "id", "shop") SELECT "accessToken", "id", "shop" FROM "Session";
DROP TABLE "Session";
ALTER TABLE "new_Session" RENAME TO "Session";
CREATE UNIQUE INDEX "Session_shop_key" ON "Session"("shop");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
