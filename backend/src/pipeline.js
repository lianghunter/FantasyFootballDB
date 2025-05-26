import dotenv from 'dotenv';
import OpenAI from 'openai';

dotenv.config();

// Utility: Clean up SQL output from GPT
function cleanSql(raw) {
  if (typeof raw !== 'string') return '';
  return raw
    .replace(/```sql/gi, '')
    .replace(/```/g, '')
    .trim();
}

// Initialize OpenAI client
const ai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

// Define your actual schema here (this is what GPT sees)
const schema_describe = `
Tables:
- League(league_id, league_name, league_champion_id)
- LeagueMember(member_id, name, league_id)
- ProfessionalTeam(pro_team_id, team_name, schedule_id)
- ProTeamSchedule(pro_team_id, week_1_opponent_id, week_2_opponent_id)
- MemberSchedule(member_id, week_1_opponent_id, week_2_opponent_id)
- FootballPlayer(player_id, owner_id, name, age, ranking, pro_team_id, position)
- Quarterback(player_id, yards_thrown)
- Runningback(player_id, yards_run)
- Receiver(player_id, yards_received)
`;

// Exported function for turning user questions into SQL
export async function generateSQL(user_question) {
  const messages = [
    {
      role: 'system',
      content: `You are a helpful assistant that translates natural language questions into SQL queries. 
You MUST return **only** the valid SQL statement, with no markdown, no code fences, and no explanations.
If the question is unrelated to SQL or this database, reply exactly:
NO_SQL
You have access to the following database schema:
${schema_describe}`
    },
    {
      role: 'user',
      content: user_question,
    }
  ];

  const response = await ai.chat.completions.create({
    model: 'gpt-3.5-turbo',
    messages,
    temperature: 0,
  });

  const sql = response.choices[0].message.content.trim();
  return cleanSql(sql);
}
