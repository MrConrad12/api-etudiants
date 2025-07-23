import express, { Request, Response } from "express"

const app = express(); 
const PORT = process.env.PORT || 3000;
const etudiants = [
    { id: 1, nom: "Rakoto", prenom: "Jean", filiere: "Informatique" },
    { id: 2, nom: "Rabe", prenom: "Marie", filiere: "Mathématiques" },
    { id: 3, nom: "Ando", prenom: "Lucas", filiere: "Physique" },
]; 

app.get("/", (req: Request, res: Response) => {
    res.json("Hello")
}) 

app.get("/etudiants", (req: Request, res: Response) => {
    res.json(etudiants)
})
 

app.listen(PORT, ()=> {
    console.log(`API en cours d'exécution sur http://localhost:${PORT}`);
})