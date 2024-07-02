% Charger l'image
image = imread('C:\Users\natha\Desktop\Calque 1.jpg');
image_gray = rgb2gray(image); % Convertir en niveaux de gris si l'image est en couleur

% Correction des ombrages
image_gray_double = double(image_gray); % Convertir en double pour les opérations arithmétiques
background = imgaussfilt(image_gray_double, 50); % Appliquer un filtre gaussien pour obtenir une image de fond
image_corrected = image_gray_double - background; % Soustraire l'image de fond
image_corrected = mat2gray(image_corrected); % Normaliser entre 0 et 1
image_corrected = im2uint8(image_corrected); % Convertir en uint8 pour la visualisation et l'export

% Réduction du bruit
image_denoised = imgaussfilt(image_corrected, 2); % Appliquer un filtre gaussien pour réduire le bruit

% Conversion en height map
height_map = mat2gray(image_denoised); % Normaliser entre 0 et 1
height_map = im2uint8(height_map); % Convertir en uint8 pour Blender

% Visualisation de la height map
imshow(height_map);
colorbar;

% Sauvegarde de la height map
imwrite(height_map, 'height_map.jpg');
