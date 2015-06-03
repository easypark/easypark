package edu.isep.easypark.model;

import java.io.Serializable;

public class Voiture implements Serializable{
	String marque;
	String modele;
	String couleur;
	int taille;
	int id_user;
	

	@Override
	public String toString() {
		return "Voiture [marque=" + marque + ", modele=" + modele + ", taille="
				+ taille + ", couleur"+ couleur + "]";
	}
	public Voiture() {
		super();
		this.taille = 0;
		this.id_user = 0;
	}

	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getModele() {
		return modele;
	}
	public void setModele(String modele) {
		this.modele = modele;
	}
	public String getCouleur() {
		return couleur;
	}
	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}
	public int getTaille() {
		return taille;
	}
	public void setTaille(int taille) {
		this.taille = taille;
	}
	
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}


}
