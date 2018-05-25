-- Modifications des données de la bdd de v3.1.0. à v3.2.0

UPDATE `system` SET `value`='v3.2.0' WHERE `name`='gynobs';

SET @catID = (SELECT data_cat.id FROM data_cat WHERE data_cat.name='porteursReglement');
INSERT IGNORE INTO `data_types` (`groupe`, `name`, `placeholder`, `label`, `description`, `validationRules`, `validationErrorMsg`, `formType`, `formValues`, `module`,`cat`, `fromID`, `creationDate`, `durationLife`, `displayOrder`) VALUES
 ('reglement', 'gynobsReglePorteurS1', '', 'Règlement', 'Règlement conventionné S1', '', '', '', 'baseReglementS1', 'gynobs', @catID, 1, '2018-01-01 00:00:00', 1576800000, 1);

UPDATE `data_types` SET `name`='gynobsReglePorteurS2', `formValues`='baseReglementS2', `description`='Règlement conventionné S2' WHERE `name`='gynobsReglePorteur';

UPDATE `forms` SET `yamlStructure`='structure:\r\n  row1:                              # 1re rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - poids,plus={<i class="fa fa-clone duplicate"></i>} #34   Poids\n    col2:                            # 2e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - taillePatient,plus={<i class="fa fa-clone duplicate"></i>} #35   Taille\n    col3:                            # 3e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - imc,readonly,plus={<i class="fa fa-chart-line graph"></i>} #43   IMC\n  row2:                              # 2e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - groupeSanguin                            		#37   Groupe sg\n    col2:                            # 2e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          \r\n        - toxoStatut                               		#36   Toxo.\n    col3:                            # 3e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          \r\n        - rubStatut                                		#246  Rubéole\n  row3:                              # 2e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12\r\n      bloc:                          # Types utilisés\r\n        - job                                      		#19   Activité professionnelle\n        - allergies,rows=2                         		#66   Allergies\n        - toxiques                                 		#42   Toxiques\n  row4:                              # 3e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12\r\n      bloc:                          # Types utilisés\r\n        - atcdObs,rows=6                           		#40   Antécédents obstétricaux\n        - atcdPersoGyneco,rows=6                   		#39   Antécédents gynécologiques\n        - atcdMedicChir,rows=6                     		#41   Antécédents médico-chirugicaux\n        - atcdFamiliaux,rows=6                     		#38   Antécédents familiaux', `yamlStructureDefaut`='structure:\r\n  row1:                              # 1re rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - poids,plus={<i class="fa fa-clone duplicate"></i>} #34   Poids\n    col2:                            # 2e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - taillePatient,plus={<i class="fa fa-clone duplicate"></i>} #35   Taille\n    col3:                            # 3e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - imc,readonly,plus={<i class="fa fa-chart-line graph"></i>} #43   IMC\n  row2:                              # 2e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          # Types utilisés\r\n        - groupeSanguin                            		#37   Groupe sg\n    col2:                            # 2e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          \r\n        - toxoStatut                               		#36   Toxo.\n    col3:                            # 3e colonne  \r\n      size: 12 col-12 col-sm-4 col-lg-4\r\n      bloc:                          \r\n        - rubStatut                                		#246  Rubéole\n  row3:                              # 2e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12\r\n      bloc:                          # Types utilisés\r\n        - job                                      		#19   Activité professionnelle\n        - allergies,rows=2                         		#66   Allergies\n        - toxiques                                 		#42   Toxiques\n  row4:                              # 3e rangée\r\n    col1:                            # 1re colonne  \r\n      size: 12\r\n      bloc:                          # Types utilisés\r\n        - atcdObs,rows=6                           		#40   Antécédents obstétricaux\n        - atcdPersoGyneco,rows=6                   		#39   Antécédents gynécologiques\n        - atcdMedicChir,rows=6                     		#41   Antécédents médico-chirugicaux\n        - atcdFamiliaux,rows=6                     		#38   Antécédents familiaux' WHERE `internalName`='gynObsATCD';

-- Correction des glyphicon pour bs4
update `forms` set yamlStructure = REPLACE(yamlStructure, 'termeLCCFA,readonly ','termeLCCFA,readonly,plus={<i class="fa fa-save"></i>} ');
update `forms` set yamlStructure = REPLACE(yamlStructure, 'termeLCCFB,disabled,readonly ','termeLCCFB,disabled,readonly,plus={<i class="fa fa-save"></i>} ');
update `forms` set yamlStructure = REPLACE(yamlStructure, 'termeLCCFC,disabled,readonly ','termeLCCFC,disabled,readonly,plus={<i class="fa fa-save"></i>} ');

update `forms` set yamlStructure = REPLACE(yamlStructure, 'E11termeLCCFA,readonly ','E11termeLCCFA,readonly,plus={<i class="fa fa-save"></i>} ');
update `forms` set yamlStructure = REPLACE(yamlStructure, 'E11termeLCCFB,disabled,readonly ','E11termeLCCFB,disabled,readonly,plus={<i class="fa fa-save"></i>} ');
update `forms` set yamlStructure = REPLACE(yamlStructure, 'E11termeLCCFC,disabled,readonly ','E11termeLCCFC,disabled,readonly,plus={<i class="fa fa-save"></i>} ');

update `forms` set yamlStructure = REPLACE(yamlStructure, 'glyphicon glyphicon-save','fa fa-save');

update `forms` set yamlStructure = REPLACE(yamlStructure, 'imc,readonly,plus={<i class="fa fa-chart-line graph"></i>}','imc,readonly') where internalName = 'gynObsATCD';

-- Passage des datas grossesse dans base
update `data_types` set module='base' where name in ('nouvelleGrossesse', 'groFermetureSuivi', 'ddgReel', 'ddg', 'DDR', 'terme9mois','termeDuJour' );

-- Petite correction
UPDATE `data_types` SET `formValues` = '' WHERE name = 'DDR';

-- Configuration propre au module
INSERT IGNORE INTO `configuration` (`name`, `level`, `toID`, `module`, `cat`, `type`, `description`, `value`) VALUES
('lapActiverAtcdStrucSur', 'module', 0, 'gynobs', 'LAP', 'texte', '', 'atcdObs,atcdPersoGyneco,atcdMedicChir'),
('lapActiverAllergiesStrucSur', 'module', 0, 'gynobs', 'LAP', 'texte', '', 'allergies'),
('lapAtcdStrucPersoPourAnalyse', 'module', 0, 'gynobs', 'LAP', 'texte', '', 'atcdObs,atcdPersoGyneco,atcdMedicChir'),
('lapAllergiesStrucPersoPourAnalyse', 'module', 0, 'gynobs', 'LAP', 'texte', '', 'allergies');

-- Reclassement des forms de synthèse patient
SET @catID = (SELECT forms_cat.id FROM forms_cat WHERE forms_cat.name='formSynthese');
update forms set cat=@catID where name in('gynObsSyntheseObs','gynObsSyntheseGyn');