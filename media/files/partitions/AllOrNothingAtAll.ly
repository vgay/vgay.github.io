
\version "2.20.0"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"All or Nothing at All"
composer = #"Arthur Altman"
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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
a1*6:m7+ bes1*2:11+ g:m d:m g:7 c1:7+ b2:m5-7 e:9+ 
g1*2:m d:m g:7 c1:7+ bes2:m es:7 
as1*6:7+ bes1:m7 es:7 
bes1*3:m g2:m5-7 c:9+
f1:m7 des:7 c:7 b2:m5-7 e:9+ 
 g1:m7 e2:m5-7 a:9+ d1:m b2:m5-7 e:9+ a1:m f:m6 c1 
\startParenthesis \parenthesize b2:m5-7 \endParenthesis \parenthesize e:9+

}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 4/4
  \showStartRepeatBar \bar "[|:"
\repeat volta 3 {
  \A
  e1 ~ | e4 e \times 2/3 { e f c } | e1 ~ | e
  e2 e | e \times 2/3 { e4 g c, } | d4. d8 d2 ~ | d1 \break
   \set Score.voltaSpannerDuration = #(ly:make-moment 3 4)
 
}
\alternative {
  { d2 d | d \times 2/3 { e4 cis d } | a'4. a8 a2 ~ | a b4 a | g g2 g4 g g2 g4 g1 R  \break }
  { d4. d8 d4. d8 | d4. d8 \times 2/3 { e4 cis d } | a'4. a8 a2 ~ | a b4 a | g g2 g4 | g g2 g4 | g1 ~ | g2 r4 es
 \break
\B
c'4 c c c | c4. c8 \times 2/3 { c4 des as } | c1 ~ | c2 r4 es,
c'4. c8 c4. c8 | des2 \times 2/3 { c4 bes as } | g1 ~ | g2 r4 es \break
\times 2/3 { bes'4 bes bes } bes4. bes8 | \times 2/3 { bes4 bes bes } \times 2/3 { bes4 c g } | bes1 ~ | bes2 c4 bes |
as2 as4 as | as4 as2 as4 | g1 | r4 d c b  \break }

{ d2 d ~ | d4. d8 \times 2/3 { e4 cis d } | a'1 | b | c ~ | c4 c \times 2/3 { c c c } | c1 | R }}
\bar ".." 
}

verse = \lyricmode {
 All __ or no -- thing at all __
Half of love, ne -- ver ap -- pealed to me __
If your heart, ne -- ver could yield to me __
Then I'd ra -- ther have no -- thing at all


% I said all or nothing at all
% If it's love, there ain?t no in between
Why be -- gin then cry, for some -- thing that might have been __
No I'd ra -- ther have no -- thing at all
% 
Hey please don't bring your lips so close to my cheek __
 Don't smile or I'll be lost be -- yond re -- call __
The kiss in your eyes, the touch of your hand makes me weak __
And my heart it may grow very diz -- zy and fall
% 
% And if I fell under the spell of your call
% I would be, be caught in the undertow
Well you see, I've got to say no, no,
All or no -- thing at all   
}

verseB = \lyricmode {
   All __ or no -- thing at all __
If it's love, there ain't no in bet -- ween __
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 a1:m7+ \break
  \repeat percent 2 a:m7+ \repeat percent 2 bes:9.11+ \break
  \set Score.repeatCommands = #'((volta "1"))
  \repeat percent 2 g:m \set Score.repeatCommands = #'((volta #f))
  \repeat percent 2 d:m \break
  \repeat percent 2 g:7 c:7+ \/ b2:m5-7 e:9+ \break
  \bar ":|]" \set Score.repeatCommands = #'((volta "2"))
  \repeat percent 2 g1:m \set Score.repeatCommands = #'((volta #f))
  \repeat percent 2 d:m \break
  \repeat percent 2 g:7 c:7+ \/ bes2:7 es:7 \break \bar "||"
  \repeat percent 4 as1:7+ \break
  \repeat percent 2 as:7+ bes:m7 es:7 \break
  \repeat percent 3 bes1:m \/g2:m5-7 c:9+\break
  f1:m7 des:7 c:7 \/b2:m5-7 e:9+
  \bar ":|]" \set Score.repeatCommands = #'((volta "3"))
  g1:m7 \/e2:m5-7 a:9+  \set Score.repeatCommands = #'((volta #f))
 d1:m \/b2:m5-7 e:9+ \break
 a1:m f:m6 c \/b2:m5-7 e:9+
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*23 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
 }


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
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
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
          \addlyrics \verse
          \addlyrics \verseB
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
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
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
          \addlyrics \verse
          \addlyrics \verseB
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }