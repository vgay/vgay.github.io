\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 12)
                             (padding . 1))

}

title = #"Fever"
composer = #"ohn Davenport and Eddie Cooley"
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
  asplayed = #"Peggy Lee" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=JGb5IweiYG8"
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
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "the melody is transposed one tone upper before verse 3 and before verse 4" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s1*4 \repeat unfold 2 { a2:m7 c:6 a:m7 e:5+7 }
  a:m7 es:6 d:m7 g:7 b:m5-7 e:5+7 a:m7 bes:7+
  \repeat unfold 2 { a2:m7 c:6 a:m7 e:5+7 }
  a:m7 es:6 d:m7 g:7 b:m5-7 e:5+7 a:m7 bes:7+
  a1*4:m7 a1*2:m7 e1:7 a:m7
  b2:m5-7 e:5+7 a:m7 bes:7+ b2:m5-7 e:5+7 a:m7 bes:7+ b2:m5-7 e:5+7 a2..:m7 bes:7+
}


theNotes =  \relative c {
  \clef "bass" \key c \major \time 4/4 \oneVoice
  \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box \bold Intro \smaller "(Piano & Bass)"}
  a4 r c r | a r8 e~ e4 gis | a4 r c r | a r8 e~ e4 gis | \break
  \clef "treble"
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup {  \raise #-1 \box A \with-color #red \bold \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    d'''8 c d c d4 a8 c~ | c d4. r2 | d8 c d c d c a a~ | a2 r | \break
    d8 c d c d4 a8 c~ | c d4. r8 a a a | d8 c d c d c a a~ | a a a a c4 a
    \bar "||"  \break
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup { \box B " (chorus)" }
    R1 | r8 es'4 c8 d4 c | d8 c d c d( c) a a~ | a2 r |\break
    gis'8 a-^r4 r d,8 c | d c r2.
    %\once \override Score.RehearsalMark.extra-offset = #'(0 . -4)
    \mark \markup { \with-color #red \musicglyph "scripts.varcoda" }
    | d8 c es4  d8 c a a~ | a4 r2.  } \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box C " (Played beetwen verses 2 and 3)" }
  r4 c8 a a4 g | r4 a8 g a4 c | r4 c8 a a4 g | a g a2 | \break
  r4 c8 a a4 g | r4 a8 g a4 c | d8 c d c e c a4 | a r4 r2 \break \bar "||"
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "D.S. (verses 3 to 5) then Coda"
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \repeat unfold 2 { d8 c d c d c a a~ | a2 r | }
  d8 c d c d c a a \laissezVibrer |
  \voiceOne a1~ | a \fermata
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red \column { \line { \pad-around #2 " " } \line { "Melody is transposed one tone upper before verse 3 and before verse 4" } }
  \bar ".."
}
accolade = \set stanza = \markup {
  \hspace #1 \raise #2 \right-brace #30
}
rythme = \relative c' {
  \override Rest #'staff-position = #-8
  \override NoteHead.no-ledgers = ##t % pas de lignes additionelles
  s1*33 \improvisationOn r8 b-> r4 4-^ r8 8->~ 1 \improvisationOff
}

dropLyrics = {
  \override LyricText.extra-offset = #'(0 . 1.5)
  \override LyricHyphen.extra-offset = #'(0 . 1.5)
}

lyricsI = \lyricmode {
  \repeat unfold 10 { \skip 1 }
  Ne -- ver know how much I love you
  Ne -- ver know how much _  I care
  When you put your arms a -- round me
  I get a fee -- ling that's so hard _ to bear


  \repeat unfold 5 { \skip 1 }
  when you kisse me
  Fe -- ver when you hold me tight
  Fe -- ver in the mor -- ning
  Fe -- ver all through _  the night

  Ev -- 'ry -- bo -- dy's got the fe -- ver
  That is some -- thing you all know
  Fe -- ver is -- n't such a new thing
  Fe -- ver Start -- ed long _  a -- go

  What a lo -- ve -- ly way to burn
  What a lo -- ve -- ly way to burn
  What a lo -- ve -- ly way to burn
}

lyricsapres = \lyricmode {  you give me fe -- ver }


lyricsII = \lyricmode {
  \repeat unfold 10 { \skip 1 }
  Sun _  lights _  up the day time
  Moon _ lights _ up _ the night
  I light up when you call my name
  And _ you know I'm gon -- na treat _ you right
}



grille = \chordmode {
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Verses and Chorus"
  \repeat volta 2 { \repeat unfold 2 { \/a2:m7 c:6 \/a:m7 e:5+7 } \break
                    \/a:m7 es:6 \/d:m7 g:7
                    \mark \markup { \with-color #red \fontsize #-1  \musicglyph "scripts.varcoda" }
                    \/b:m5-7 e:5+7 \/a:m7 bes:7+ } \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \column { \line { " " } \hspace #5 \line { "Interlude betwen verses 2 and 3" } }
  \repeat percent 4 { a1:m7 }  \break
  \repeat percent 2 { a1:m7 } e1:7 a:m7 \bar "|."
  \mark  \markup { \with-color #red \fontsize #-1 \musicglyph "scripts.varcoda" }
  \repeat unfold 2 { \/b2:m5-7 e:5+7 \/a:m7 bes:7+ } \break
  \/b2:m5-7 e:5+7 \v a2.:m7 bes4:7+
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(14 . 12)
  \mark \markup { \with-color #red \bold \musicglyph "scripts.ufermata" }
  bes1:7+ \bar ".." \stopStaff s1 \bar ""


}

marques = \relative c' {
  %s1*23 s2 _\markup { \with-color #red \bold \musicglyph "scripts.ufermata" }
  %   s1 ^\markup \bold \box \fontsize #5 B s1*3
  %   s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ \rythme
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\ \rythme
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes \\ \rythme
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ \rythme
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
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\ \rythme
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
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes \\ \rythme
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
        \transpose c a \grille
      >>
} } }

\book {
  \paper { page-count = #2
           #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "Vocala4")
    \score {
      <<
        \new ChordNames \harmonies
        \new Staff <<
        \new Voice = m \theNotes
        \addlyrics \lyricsI
        \addlyrics {
          \lyricsII \accolade
          \dropLyrics
          \lyricsapres
        }
        \\ \rythme
      >> >>
    }
    \pageBreak
    \markup \fontsize#2 {
      \vspace #5
      \fill-line {
        \hspace #1
        \column {
          \line { 3- }
          \line { Romeo loved Juliet }
          \line { Juliet she felt the same }
          \line { When he put his arms around her  }
          \line { he said ''Julie, baby, you're my flame.''  }
          \hspace #2
          \line { Thou giveth fever, when we kisseth }
          \line { Fever with thy flaming youth }
          \line { Fever I'm a fire  }
          \line { Fever, yea, I burn forsooth }
        }
        \hspace #2
        \column {
          \line { 4- }
          \line { Captain Smith and Pocahontas }
          \line { Had a very mad affair }
          \line { When her daddy tried to kill him }
          \line { She said, ''Daddy, oh no, don't you dare.'' }
          \hspace #2
          \line { He gives me fever, with his kisses }
          \line { Fever when he holds me tight }
          \line { Fever I'm his missus }
          \line { Daddy won't you treat him right }
        }
        \hspace #1
      }
    }
    \markup \fontsize#2 {
      \vspace #5
      %\hspace #1
      \center-align
      \fill-line {
        \vspace #1
        \column {
          \line { 5- }
          \line { Now you've listened to my story }
          \line { Here's the point that I have made }
          \line { Chicks were born to give you fever  }
          \line { Be it farenheit or centigrade
          }
          \hspace #2
          \line { They give you fever, when you kiss them }
          \line { Fever if you live and learn }
          \line { Fever 'til you sizzle }
          \line { What a lovely way to burn (x3) }
        }
      }
    }
} }







