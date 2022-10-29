import {Entity, Column, PrimaryColumn, OneToMany} from "typeorm";
import { Credit } from "./Credit";

@Entity()
export class Title {
  @PrimaryColumn()
  id: number;

  @Column()
  title: string;

  @Column()
  type: string;

  @Column()
  description: string;

  @Column()
  releaseYear: number;

  @Column()
  ageCertification: string;

  @Column()
  runtime: number;

  @Column()
  genres: string;

  @Column()
  productionCountries: string;

  @Column()
  seasons: number;

  @Column()
  imdbId: number | null;

  @Column()
  imdbScore: number | null;

  @Column()
  imdbVotes: number | null;

  @Column({type: "decimal"})
  tmdbpopularity: number;

  @Column()
  tmdbScore: number | null;

  @OneToMany(type => Credit, credit => credit.id) credits: Credit[]
}