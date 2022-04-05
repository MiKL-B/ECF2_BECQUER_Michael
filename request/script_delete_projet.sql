-- - Supprimer de la base de données les projets qui sont terminés et qui n’ont pas eu de charges (étapes) associées.
DELETE FROM projet WHERE date_reelle_fin IS NOT NULL;
