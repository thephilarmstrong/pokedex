import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { SupabaseClient, createClient } from '@supabase/supabase-js'
import { EggGroup } from '../../supabase/functions/_shared/pokeapi/types/egg-group';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'pokedex';

// Create a single supabase client for interacting with your database
  private supabase: SupabaseClient = createClient('https://wnwpjqbyrvapsvycahyb.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indud3BqcWJ5cnZhcHN2eWNhaHliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc3Nzc3NTEsImV4cCI6MjAzMzM1Mzc1MX0.uXj-V_pzU05qek1G4gZhcvMKYLzh9UMgndJ8pWP2ojE')

  async click() {

    const eggGroup: EggGroup = { id: 1, name: 'name' }

    const asdf = await this.supabase.from('egg_group')
    .insert(eggGroup)
    .select();

    console.log(asdf);
  }
}
