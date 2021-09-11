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

title = #"Watch What Happens"
composer = #"Michel Legrand"
meter = #" (Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"
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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
    tagline = ##f
}

theNotes = \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \repeat volta 2 {
    \A \bar "[|:"
    g4. g8 ~ g4 g ~ | \times 2/3 { g4 c, es } \times 2/3 { g f es } |
    g1 | \times 2/3 { r4 c, es } \times 2/3 { g f es } \break
    g1 | \times 2/3 { r4 c, es } \times 2/3 { g f es } 
    g2 gis 
  }
  \alternative {
    { a2 gis \bar ":|]"}
    { a bes }
  }
  \bar "||" \break
  \B
  b1 | r4 d,8 g c b a g |
  bes4. a8 bes2 ~ | bes a4 g \break
  c,4. a'8 a2 ~ | \times 2/3 { a4 c, f } \times 2/3 { a g f }
  as?1 ~ | as \bar "||" \break
  \C
  g4. g8 ~ g4 g ~ | \times 2/3 { g4 c, es } \times 2/3 { g f es } |
  g1 | \times 2/3 { r4 c, es } \times 2/3 { g f es } \break
  g1 | \times 2/3 { r4 c, es } \times 2/3 { g f es } 
  es2. es4 | e e d8 d4 es8 ~ \break
  es2. es4 | e e d8 d4 es8 ~ | es1 ~ es
  \bar "|." }


harmonies = \chordmode {
  es1*2:7+ f:9 f1:m9 bes2:13sus4 bes:13 
  es:7+ e:7+ f:7+ e:7+ f:7+ ges:7+
  g1*2:7+ g1:m7 c:7 f1*2:7+ f1:m7 bes:7
  es1*2:7+ f:9 f1:m9 bes2:13sus4 bes:13 
  es1:6 e2:6 d4.:6 es8:6
  es1:6 e2:6 d4.:6 es8:6 s1 
  \startParenthesis \parenthesize f2:m7 
  \endParenthesis \parenthesize bes:7
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 { es1:7+ }
  \repeat percent 2 { f:9 }
  \break
  f:m9
  \/ bes2:13sus4 bes:13
  \/ es:7+ e:7+
  \set Score.repeatCommands = #'((volta "1"))
  \s f:7+ e:7+ 
  \set Score.repeatCommands = #'((volta #f)) 
  \bar ":|]" \break
  \stopStaff s1 \bar "" s \bar "" s 
  \set Score.repeatCommands = #'((volta "2"))
  \/ f2:7+ ges:7+ \bar "||"
  \set Score.repeatCommands = #'((volta #f)) \break
  \startStaff
  \repeat percent 2 { g1:7+ }
  g:m7
  c:7 \break
  \repeat percent 2 { f:7+ }
  f:m7
  bes:7
  \repeat percent 2 { es1:7+ }
  \repeat percent 2 { f:9 }
  \break
  f:m9
  \/ bes2:13sus4 bes:13 \startStaff
  es1:6
  \/ e2:6 d:6  \startStaff \break
  es1:6
  \/ e2:6 d:6  \startStaff
  es1:6
  \/ f2:m7 bes:7
  \bar ".."
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 C
}

verse = \lyricmode {
  Let some -- one start be -- lie -- ving in you
Let him hold out his hand
Let him touch you and watch what hap -- pens \skip 1 \skip 1



Cold, no I won't be -- lieve your heart is cold __
May -- be just a -- fraid to be bro -- ken a -- gain __

Let some -- one with a deep love to give
Give that deep love to you
And what ma -- gic you'll see


Let some -- one give his heart
Some -- one who cares like me __

}

verseB = \lyricmode {
  One some -- one who can look in your eyes
And see in -- to your heart
Let him find you and watch what \skip 1 \skip 1 hap -- pens
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
            \new Voice = "PartPOneVoiceOne" { \transpose c a \theNotes }
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }  } 
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