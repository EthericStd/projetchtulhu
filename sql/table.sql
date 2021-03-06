CREATE TABLE Client
(
    NumClient serial,
    NomClient str,
    PrenomClient str,
    DateNaissanceClient date,
    MailClient mail,
    MdpClient str,
    PRIMARY KEY (NumClient)
);

CREATE TABLE Vendeur
(
    NumVendeur serial,
    NomVendeur str,
    AdresseVendeur str,
    MailCommandeVendeur mail,
    MailDiscutionVendeur mail,
    DescriptionVendeur bstr,
    NumClient serial,
    PRIMARY KEY (NumVendeur),
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE AdresseFacturation
(
    NumAdresseFacturation serial,
    NomPrénomAdresseFacturation str,
    AdresseLigne1AdresseFacturation str,
    AdresseLigne2AdresseFacturation str,
    VilleAdresseFacturation str,
    PaysAdresseFacturation str,
    CodePostalAdresseFacturation CP,
    PRIMARY KEY (NumAdresseFacturation)
);

CREATE TABLE PossedeAdrFacturation
(
    NumClient serial,
    NumAdresseFacturation serial,
    PRIMARY KEY (NumAdresseFacturation, NumClient),
    FOREIGN KEY (NumAdresseFacturation) REFERENCES AdresseFacturation,
    FOREIGN KEY (NumClient) REFERENCES Client
);


CREATE TABLE AdresseLivraison
(
    NumAdresseLivraison serial,
    NomPrénomAdresseLivraison str,
    AdresseLigne1AdresseLivraison str,
    AdresseLigne2AdresseLivraison str,
    VilleAdresseLivraison str,
    PaysAdresseLivraison str,
    CodePostalAdresseLivraison CP,
    PRIMARY KEY (NumAdresseLivraison)
);

CREATE TABLE PossedeAdrLivraison
(
    NumClient serial,
    NumAdresseLivraison serial,
    PRIMARY KEY (NumAdresseLivraison, NumClient),
    FOREIGN KEY (NumAdresseLivraison) REFERENCES AdresseLivraison,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE CartePaiement
(
    NumCartePaiement serial,
    TypeCartePaiement str,
    NuméroCartePaiement bigint,
    NomDétenteurCartePaiement str,
    DateExpirationCartePaiement dateCB,
    CryptogrammeCartePaiement int,
    PRIMARY KEY (NumCartePaiement)
);

CREATE TABLE PossedeCartePaiement
(
    NumClient serial,
    NumCartePaiement serial,
    PRIMARY KEY (NumCartePaiement, NumClient),
    FOREIGN KEY (NumCartePaiement) REFERENCES CartePaiement,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE Panier
(
    NumPanier serial,
    DateCréationPanier date,
    DateDernièreModifPanier date,
    DateCommandePanier date,
    NumClient serial,
    PRIMARY KEY (NumPanier),
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE Article
(
    NumArticle serial,
    LibelléArticle str,
    DescriptionArticle bbstr,
    PointsArticle int,
    PrixArticle real,
    QuantitéStock int,
    DateMiseVente date,
    DateAnnulationVente date,
    NumVendeur serial,
    PRIMARY KEY (NumArticle),
    FOREIGN KEY (NumVendeur) REFERENCES Vendeur
);

CREATE TABLE Tags
(
    NumTags serial,
    NomTags str,
    ValeurTags str,
    NumArticle serial,
    PRIMARY KEY (NumTags),
    FOREIGN KEY (NumArticle) REFERENCES Article
);

CREATE TABLE MAJStock
(
    NumHistoriqueMAJ serial,
    DateHistoriqueMAJ date,
    NbMAJStock int,
    NumArticle serial,
    NumVendeur serial,
    PRIMARY KEY (NumHistoriqueMAJ),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumVendeur) REFERENCES Vendeur
);

CREATE TABLE Commentaire
(
    NumArticle serial,
    NumClient serial,
    ContenuCommentaire bstr,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE Note
(
    NumArticle serial,
    NumClient serial,
    ValeurNote int,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE ListeDeSouhait
(
    NumArticle serial,
    NumClient serial,
    DateAjoutListeDeSouhait date,
    PRIMARY KEY (NumArticle, NumClient),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE HistoriqueVisite
(
    NumHistoriqueVisite serial,
    DateVisite date,
    NumArticle serial,
    NumClient serial,
    PRIMARY KEY (NumHistoriqueVisite),
    FOREIGN KEY (NumArticle) REFERENCES Article,
    FOREIGN KEY (NumClient) REFERENCES Client
);

CREATE TABLE ArticlePanier
(
    NumPanier serial,
    NumArticle serial,
    NbArticlePanier int
);
