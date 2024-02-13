SELECT * FROM Project2..NashvilleHousing

--Standardize Date Format
SELECT SaleDateConverted, CONVERT(date, SaleDate)
FROM Project2..NashvilleHousing

Update NashvilleHousing
SET SaleDate=CONVERT(date, SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted=CONVERT(date, SaleDate)

--Populate Property Address data
SELECT *
FROM Project2..NashvilleHousing
--WHERE PropertyAddress is null
ORDER BY ParcelID


--Self join
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Project2..NashvilleHousing a
JOIN Project2..NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Project2..NashvilleHousing a
JOIN Project2..NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

--Breaking out Address into Individual Columns (Address, City, State)

SELECT PropertyAddress
FROM Project2..NashvilleHousing
--WHERE PropertyAddress is null
--ORDER BY ParcelID

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress) )as Address
FROM Project2..NashvilleHousing

ALTER TABLE NashvilleHousing
Add  PropertySplitAddress nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress=SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE NashvilleHousing
Add  PropertySplitCity nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity =SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress) )

SELECT *
FROM Project2..NashvilleHousing

SELECT OwnerAddress
FROM Project2..NashvilleHousing

SELECT 
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM Project2..NashvilleHousing

ALTER TABLE NashvilleHousing
Add  OwnerSplitAddress nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity =PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState =PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

SELECT *
FROM Project2..NashvilleHousing

--Change N and Y to Yes and No in "SOld as Vacant" field

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM Project2..NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
       WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
FROM Project2..NashvilleHousing

UPDATE NashvilleHousing
SET SoldAsVacant=CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
                 WHEN SoldAsVacant = 'N' THEN 'No'
	             ELSE SoldAsVacant
	             END

--Remove duplicates

WITH RowNumCTE as (
SELECT *,
   ROW_NUMBER() OVER (
   PARTITION BY ParcelID,
                PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
   ORDER BY UniqueID) row_num

FROM Project2..NashvilleHousing
)

--DELETE
--FROM RowNumCTE
--WHERE row_num > 1
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress


--Delete unused columns 

SELECT *
FROM Project2..NashvilleHousing

ALTER TABLE Project2..NashvilleHousing
DROP COLUMN TaxDistrict

--ALTER TABLE Project2..NashvilleHousing
--DROP COLUMN TaxDistrict, SaleDate, PropertyAddress, OwnerAddress








