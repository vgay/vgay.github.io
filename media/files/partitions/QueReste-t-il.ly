
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Que reste-t-il de nos amours ?"
composer = #"Charles Trenet"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
s4 es2:m es:m7+ es:m7 es:m6 f1:m5-7 bes:13-
es2:m es:m7+ es:m7 es:m6 f1:m5-7 bes:9-
es2:m es:m7+ es:m7 es:m6 f1:m5-7 bes:13-
es:7+ c2:m5-7 f:7 f1:m7sus4 bes:9
f:m7 bes:7 es2:7+ as:7 g:m7 ges:dim
f1:m7 bes:7 es2:7+ as:7 g:m7 c:7
bes1:7 bes:m7 es:7
as:7+ as2:m7 des:7 es:6 as:7 g:m7 c:7
f1:m7 c2:m7 f:7 f1:m7 bes2:7 c:7 
bes1:7 es2:7+ \startParenthesis \parenthesize as:7 g:m7 \endParenthesis \parenthesize c:7
}
 

theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \Intro \oneVoice
  \partial 4 bes4 | % 1
    bes'1 ~ | % 2
    bes4 ces8 bes8 as8 ges8 f8 ges8 | % 3
    as1 | % 4
    r4 bes8 as8 ges8 f8 es8 f8 | % 5
    ges1 | % 6
    r4 as8 ges8 f8 es8 d8 es8 | % 7
    f1 ~ |
    f2 r4 bes,4 | \break
    bes'1 ~ | 
    bes4 des8 bes8 as8 ges8 f8 ges8 | % 11
    as1 | % 12
    r4 b8 as8 ges8 f8 es8 f8 | % 13
    g1 | % 14
    r4 bes8 ges8 f8 es8 d8 es8 | % 15
    bes'1 ~ | % 16
    bes4 r4 \times 2/3 {
      g4 as4 bes4
          } \break
  \repeat volta 3 {
\A
    g4 f4 ~ \times 2/3 {
      f4 g4 f4
    }
    | % 18
    g2 \times 2/3 {
      f4 f4 bes4
    }
    | % 19
    f2 \times 2/3 {
      es4 f4 es4
    }
    f2 \times 2/3 {
      es4 es4 as4
    }
    | % 21
    es2 \times 2/3 {
      c4 es4 c4
    }
  }
  \alternative {
    {
      | % 22
      d2 \times 2/3 {
        g4 f4 d4
      }
      | % 23
      c1 ~ | % 24
      c2 \times 2/3 { g'4 as4 bes4 } \break
    }
    {   \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
      d,2 g4 f4 
      f1 ~ | % 27
      f4 r4 \times 2/3 { es4 f4 g4 }
      \bar "||" 
      \once \override TextScript #'extra-offset = #'( -4 . 3 ) c2 ^\markup { \box \bold \fontsize #4 "B" } \times 2/3 { c4 c4 c4 }
      ces2 \times 2/3 {
        es,4 f4 g4
      }
      bes2 \times 2/3 {
        bes4 bes4 bes4
      }
      bes2 \times 2/3 {
        c,4 des4 c4
      }
      as'2 \times 2/3 {
        as4 as4 as4
      }
      g2 \times 2/3 {
        c4 c4 b4
      }
      bes!1 ~ | % 35
      bes2 \times 2/3 {
        g4 as4 bes4
      }
    }
    {
      | % 36
      d,2 \times 2/3 {
        g4 g4 g4
      }
    }
  }
  es1 ~ | % 38
  es2 
  \times 2/3 { \startParenthesis \parenthesize g4 as4 \endParenthesis \parenthesize bes4 } 
   \bar "|."
}

grille = \chordmode {
  \bar "[|:"
  \/ es2:m es:m7+ \/ es:m7 es:m6 \startStaff f1:m5-7 bes:5+7 \break
  \set Score.repeatCommands = #'((volta "1"))
  \/ es2:m es:m7+ \/ es:m7 es:m6 \startStaff f1:m5-7 bes:9-
    \set Score.repeatCommands = #'((volta #f)) 
  \bar ":|]" \break
\set Score.repeatCommands = #'((volta "2"))
es1:7+ \/ c2:m5-7 f:7 \startStaff f1:m7 bes:7
    \set Score.repeatCommands = #'((volta #f)) 
  \bar "||" \break
  
  \bar "[|:"
 f1:m7 bes:7 \/ es2:7+ as:7 \/ g:m7 ges:dim \startStaff \break
 f1:m7 bes:7 \set Score.repeatCommands = #'((volta "1")) \/ es2:7+ as:7 \/ g:m7 c:7 
 \set Score.repeatCommands = #'((volta #f)) 
  \bar ":|]" \break
  s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
  bes:m7 es:7 \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  as1:7+ \/ as2:m7 des:7  \/ es:6 as:7  \/ g:m7 c:7 \startStaff \break
  f1:m7  \/ c2:m7 f:7 \startStaff f1:m7 \/ bes2:7 c:7 \startStaff \bar "||" \break
  
 f1:m7 bes:7 \/ es2:7+ as:7 \/ g:m7 ges:dim \startStaff \break
 f1:m7 bes:7  \/ es2:7+ as:7 \/ g:m7 c:7 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*11 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7
  s1 ^\markup \bold \box \fontsize #7 A 
}

verse = \lyricmode {
  Ce soir __  le vent qui frappe à ma porte
Me par -- le des a -- mours mortes
Devant le feu qui s' é -- teint __ 
Ce soir __ c'est une chan -- son d' au -- tomne
Dans la mai -- son qui fris -- sonne
Et je pense aux jours loin -- tains __

Que res -- te t-il de nos a -- mours
Que res -- te t-il de ces beaux jours
Une pho -- to, vieil -- le pho -- to
De ma jeu -- nes -- se __
Que res -- te 
}

verseB = \lyricmode {
  \repeat unfold 49 { \skip 1 }
  t-il des bil -- lets doux
Des mois d'av  -- ril, des ren -- dez -vous
Un sou -- ve -- nir qui me pour -- \repeat unfold 8 { \skip 1 } suit
Sans ces -- se __


Bon -- heur fa -- né, che -- veux au vent
Bai -- sers vo -- lés, rê -- ves mou -- vants
Que res -- te t-il de tout ce -- la
Di -- tes le moi __

Un p'tit vil

% Les mots les mots tendres qu'on murmure
% Les caresses les plus pures
% Les serments au fond des bois
% Les fleurs qu'on retrouve dans un livre
% Dont le parfum vous enivre
% Se sont envolés pourquoi?
% 
% Que reste-t-il de nos amours
% 
% Que reste-t-il de ces beaux jours
% Une photo, vieille photo
% De ma jeunesse
% Que reste-t-il des billets doux
% Des mois d' avril, des rendez-vous
% Un souvenir qui me poursuit
% Sans cesse
}

verseC = \lyricmode {
  \repeat unfold 49 { \skip 1 }
  lage, un vieux clo -- cher
Un pa -- y -- sage si bien ca -- ché
Et dans un nuage le cher vi -- \repeat unfold 43 { \skip 1 } sage
De mon pas -- sé __
}
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \theNotes 
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \\ { s4 s1*12 \break s1*4 } 
        >>
      >>
  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \\ { s4 s1*12 \break s1*4 } 
      >> >>

  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \addlyrics \verseC
          \\ { s4 s1*12 \break s1*4 } 
      >> >>
  } }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c a \grille
      >>
} } }