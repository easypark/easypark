package edu.isep.easypark.model;
import java.io.Serializable;


public class ParkingLot implements Serializable {

	int id;
	String nom;
	String ville;
	String adresse;
	String superficie;
	int horaires;
	String type;
	String commentaire;
	int id_user;
	int note;
	

	@Override
	public String toString() {
		return "ParkingLot [nom=" + nom + ", ville=" + ville + ", adresse="
				+ adresse + ", superficie=" + superficie + ", horaires="
				+ horaires + ", type=" + type + ", commentaire=" + commentaire
				+ "]";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ParkingLot() {
		super();
		this.horaires = 0;
		this.id_user = 0;
	}

	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getSuperficie() {
		return superficie;
	}
	public void setSuperficie(String superficie) {
		this.superficie = superficie;
	}
	public int getHoraires() {
		return horaires;
	}
	public void setHoraires(int horaires) {
		this.horaires = horaires;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}
	

}
